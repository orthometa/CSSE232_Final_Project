import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

public class Assembler {


	public static void main(String[] args) {
		HashMap<String, Integer> labels = new HashMap<>();
		String fileName = "..\\ifelse.asm";
		BufferedReader bufferedReader = null;
		try {
            // FileReader reads text files in the default encoding.
            FileReader fileReader = new FileReader(fileName);
            // Always wrap FileReader in BufferedReader.
            bufferedReader = new BufferedReader(fileReader);
		} catch (FileNotFoundException e) {
			System.out.println("FILE NOT FOUND");
			return;
		}
		ArrayList<String> lines = new ArrayList<>();
		String line = null;
		try {
			while((line = bufferedReader.readLine()) != null) {
			  // Remove comments
				if(line.contains("#")) {
					line = line.substring(0, line.indexOf('#'));
				}
				if (line.trim().length() > 0) {
					lines.add(line);
				}
			}
		} catch (IOException e) {
			System.out.println("IO ERROR");
			return;
		}
		ArrayList<String> memory = new ArrayList<>();
		// Find labels and store memory addresses
		for (String ln : lines) {

			// Put labels in hashmap
			if (ln.contains(":")) {
				String[] split = ln.split(":");
				labels.put(split[0], memory.size()*2);
				ln = split[1];
			}

			// For pushi, lw, sw, split the argument into it's own address
			if (ln.contains("pushi") || ln.contains("lw") || ln.contains("sw")) {
				String[] parts = ln.split("\\s+");
				for (int i = 0; i < parts.length; i++) {
					if (parts[i].trim().length() > 0) memory.add(parts[i]);
				}
			} else {
				memory.add(ln);
			}
		}
		StringBuilder program = new StringBuilder();
		// Convert each memory address to machine code
		for (int i = 0; i < memory.size(); i++) {
			String[] words = memory.get(i).split("\\s+");
			// Remove blank first word
			if (words[0].isEmpty()) words = Arrays.copyOfRange(words, 1, words.length);
			int instruction = 0;
			if (Character.isDigit(words[0].charAt(0))) {
				instruction = Integer.parseInt(words[0]);
			}
			else {
				int opcode = getOpcode(words[0]);
				if (opcode == 0) { // A-type
					instruction = getFunc(words[0]);
				} else if (opcode < 4) {	// Branch instructions, B-type PC relative
					int address = labels.get(words[1]); 	// Get address of branch destination
					address = address - i*2;			// Subtract pc
					address = address & 0x1FFF;			// Get bottom 13 bits of result
					address = address >>> 1;			// Bit shift right once with zero extend
					instruction = (opcode << 13) + address;
				} else {	// Jump instruction
					int address = labels.get(words[1]);
					address = address & 0x1FFF;			// Get bottom 13 bits of result
					address = address >>> 1;			// Bit shift right once with zero extend
					instruction = (opcode << 13) + address;
				}
			}
			program.append(Integer.toHexString(0x10000 | i*2).substring(1).toUpperCase());
			program.append(" ");
			program.append(Integer.toHexString(0x10000 | instruction).substring(1).toUpperCase());
			program.append("\n");
		}
		System.out.println(program.toString());


	}

	// parse opcodes to get instruction type or branch type
	private static int getOpcode(String instr) {
		switch(instr) {
			case "beq": return 1;
			case "bne": return 2;
			case "bgt": return 3;
			case "j": return 4;
			case "jal": return 5;
			default: return 0;
		}
	}

	// Parse func codes to get instruction for A-types
	private static int getFunc(String instr) {
		switch(instr) {
			case "add": return 1;
			case "sub": return 2;
			case "and": return 3;
			case "or": return 4;
			case "xor": return 5;
			case "sll": return 6;
			case "srl": return 7;
			case "jr": return 8;
			case "lw": return 9;
			case "sw": return 10;
			case "pushi": return 11;
			case "dup": return 12;
			case "dup2": return 13;
			case "pop": return 14;
			case "in": return 15;
			case "out": return 16;
			case "disp": return 17;
			case "swap": return 18;
			default: throw new IllegalArgumentException();
		}
	}

}
