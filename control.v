`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2023 07:47:57 PM
// Design Name: 
// Module Name: control
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


module control(
input clk,
input rst_n,
input push,
input pop, 
input full,
input empty,
output reg[1:0] flag
    );
always@(*)
begin
if(!rst_n)
begin
    flag <= 2'b00;
end
else
    if((empty == 0 && full == 0 && push == 0 && pop == 0) || (full == 0 && empty == 1 && push == 0) || (full == 1 && empty == 0 && pop == 0))
    begin
        flag <= 2'b00;
    end
    else if((empty == 0 && full == 0 && push == 1 && pop == 0) || (full == 0 && empty == 1 && push == 1))
    begin
        flag <= 2'b01;
    end
    else if((empty == 0 && full == 0 && push == 0 && pop == 1) || (empty == 0 && full == 1 && push == 0 && pop == 1))
    begin
        flag <= 2'b10; 
    end
    else
    begin
        flag <= 2'b11;
    end
end
endmodule
