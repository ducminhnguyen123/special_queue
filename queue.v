`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 04:57:10 PM
// Design Name: 
// Module Name: queue
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


module queue(
clk, rst_n, push, pop, rd_sel, data_in, data_out, full, empty
    );
input clk;
input rst_n;
input push;
input pop;
input [3:0] rd_sel;
input [5:0] data_in;
output wire[5:0] data_out;
output wire full;
output wire empty;
wire [1:0] flag;
wire [1:0] dec_rd_sel_o;
control ctr2q(.clk(clk), .rst_n(rst_n), .push(push), .pop(pop), .full(full), .empty(empty), .flag(flag));
decode dec2q(.rd_sel(rd_sel), .dec_rd_sel_o(dec_rd_sel_o));
queue_data queda2o(.clk(clk), .rst_n(rst_n), .data_in(data_in), .dec_rd_sel_o(dec_rd_sel_o), .flag(flag), .full(full), .empty(empty), .data_out(data_out));
endmodule
