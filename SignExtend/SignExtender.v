`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:55:33 10/22/2017 
// Design Name: 
// Module Name:    SignExtender 
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
/////////////////////s/////////////////////////////////////////////////////////////
module SignExtender(
    input [12:0] in,
    output reg [15:0] out
    );
		always begin
			out[15:0] <= { {3{in[12]}}, in[12:0] };
		end
endmodule
