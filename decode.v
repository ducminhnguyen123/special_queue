`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2023 08:19:22 PM
// Design Name: 
// Module Name: decode
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decode(
input [3:0] rd_sel,
output reg [1:0] dec_rd_sel_o
    );
always @(rd_sel)
case(rd_sel)
    4'b0001 : dec_rd_sel_o = 2'd0;
    4'b0010 : dec_rd_sel_o = 2'd1;
    4'b0100 : dec_rd_sel_o = 2'd2;
    4'b1000 : dec_rd_sel_o = 2'd3;
    default : dec_rd_sel_o = 2'dx;
endcase
endmodule
