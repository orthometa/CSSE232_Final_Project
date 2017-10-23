`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:57:26 10/23/2017 
// Design Name: 
// Module Name:    addsub 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module addsub(
    input [15:0] A,
    input [15:0] B,
    input op,	 
	 output reg [15:0] out
    );
		always begin
			if (op)
				out <= A - B;
			else 
				out <= A + B;
		end
endmodule
