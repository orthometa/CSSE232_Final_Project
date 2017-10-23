`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:39 10/22/2017 
// Design Name: 
// Module Name:    reg16b 
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
module reg16b(
    input [15:0] data,
    input writeEnable,
    input clk,
    output reg [15:0] read
    );
	always @(posedge clk)
		if (writeEnable)
			read <= data; 
endmodule
