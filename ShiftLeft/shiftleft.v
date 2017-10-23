`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:50:27 10/23/2017 
// Design Name: 
// Module Name:    shiftleft 
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
module shiftleft(
    input [11:0] in,
    output reg [12:0] out
    );
		always begin
			out <= in<<1;
		end
endmodule
