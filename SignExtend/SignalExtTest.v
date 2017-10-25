`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:23:50 10/24/2017
// Design Name:   SignExtender
// Module Name:   C:/Users/lih2/Documents/GitHub/CSSE232_Final_Project/SignExtend/SignalExtTest.v
// Project Name:  SignExtend
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtender
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SignalExtTest;

	// Inputs
	reg [12:0] in;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	SignExtender uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in = 13'b000000000000;
			if(out == 16'b000000000000000)
			begin
				$display("PASS");
				//end
			else
			begin
				$display("FAIL");
				end
			#100
			in = 13'b0000000000001;
			if(out == 16'b000000000000001)
			begin
				$display("PASS");
				end
			else
				begin
				$display("FAIL");
				end
			#100
			in = 13'b0000000000011;
			if(out == 16'b000000000000011)
				begin
				$display("PASS");
				end
			else
				begin
				$display("FAIL");
				end
			#100
			in = 13'b0000000001011;
			if(out == 16'b000000000001011)
				begin
				$display("PASS");
				end
			else
				begin
				$display("FAIL");
				end

      
endmodule

