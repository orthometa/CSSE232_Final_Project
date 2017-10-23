`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:43 10/22/2017 
// Design Name: 
// Module Name:    reg16 
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
module reg16(
    input writeEnable,
    input [15:0] data,
    input clk,
    output [15:0] read
    );
	always @(posedge clk)
	read <= data; 
endmodule

