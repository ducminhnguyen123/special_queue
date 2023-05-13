`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 05:57:13 PM
// Design Name: 
// Module Name: tb_top
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


module tb_top(

    );
reg clk;
reg rst_n; 
reg push;
reg pop;
reg [5:0] data_in;
reg [3:0] rd_sel;
wire full;
wire empty;
wire [5:0] data_out;
queue queue_top(.clk(clk), .rst_n(rst_n), .push(push), .pop(pop), .data_in(data_in), .rd_sel(rd_sel), .full(full), .empty(empty), .data_out(data_out));
initial
begin
    clk = 0;
end
initial
begin
    rst_n = 0;
    push = 0;
    pop = 0;
    #10
    // PUSH ALL
    // push lan 1
    rst_n = 1;
    push = 1;
    pop = 0;
    data_in = 6'd62;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    // push lan 2
    push = 1;
    pop = 0;
    data_in = 6'd61;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    // push lan 3
    push = 1;
    pop = 0;
    data_in = 6'd59;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    // push lan cuoi
    push = 1;
    pop = 0;
    data_in = 6'd55;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd60;
    #10
    // POP ALL
    // pop lan 1
    push = 1;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    // pop lan 2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    // pop lan 3
    push = 0;
    pop = 1;
    rd_sel = 4'b0010;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    // pop lan 4
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    //PUSH THEN POP
    // push 1 pop 1
    push = 1;
    pop = 0;
    data_in = 6'd22;
    #2 
    push = 0;
    pop = 0;
    data_in = 6'dx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0100;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    // push 2 pop 2
    push = 1;
    pop = 0;
    data_in = 6'd23;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd24;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0010;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0010;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    // push 3 pop 3
    push = 1;
    pop = 0;
    data_in = 6'd25;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd26;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd27;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    push = 1;
    pop = 1;
    data_in = 6'd28;
    rd_sel = 4'b1000;
    #2
    push = 0;
    pop = 0;
    data_in = 6'dx;
    rd_sel = 4'bxxxx;
    #2
    push = 1;
    pop = 1;
    data_in = 6'd29;
    rd_sel = 4'b1000;
    #2
    push = 0;
    pop = 0;
    data_in = 6'dx;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b1000;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0010;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    // push 4 pop 4
    push = 1;
    pop = 0;
    data_in = 6'd25;
    #2
    push = 0;
    pop = 0;
    data_in = 6'dx;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd26;
    #2
    push = 0;
    pop = 0;
    data_in = 6'dx;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd27;
    #2
    push = 0;
    pop = 0;
    data_in = 6'dx;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd28;
    #2
    push = 0;
    pop = 0;
    data_in = 6'dx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b1000;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    rd_sel = 4'bxxxx;
    #2
    // PUSH and POP
    pop = 1;
    push = 1;
    data_in = 6'd49;
    rd_sel = 4'b0010;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    rd_sel = 4'bxxxx;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd51;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd63;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd10;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2
    push = 1;
    pop = 1;
    data_in = 6'd21;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 0;
    data_in = 6'dx;
    rd_sel = 4'bxxxx;
    #2
    push = 1;
    pop = 1;
    data_in = 6'd36;
    rd_sel = 4'b1000;
    #2
    push = 0;
    pop = 0;
    data_in = 6'dx;
    rd_sel = 4'bxxxx;
    #2
    rst_n = 0;
    #10
    // k?t h?p các ch?c n?ng
    // push 1, pushpop 1, pop 1
    rst_n = 1;
    pop = 0;
    push = 1;
    data_in = 6'd10;
    #2
    pop = 0;
    push = 0;
    data_in = 6'dx;
    #2
    pop = 1;
    push = 1;
    data_in = 6'd15;
    rd_sel = 4'b0001;
    #2
    pop = 0;
    push = 0;
    data_in = 6'dx;
    rd_sel = 4'bxxxx;
    #2
    pop = 1;
    push = 0;
    rd_sel = 4'b0001;
    #2
    pop = 0;
    push = 0;
    rd_sel = 4'bxxxx;
    #2
    /*pop = 0;
    push = 1;
    data_in = 6'd18;
    #2*/
    /*pop = 0;
    push = 1;
    data_in = 6'd12;
    #2
    push = 0;
    pop = 0;
    data_in = 6'bxxxxxx;
    #2*/
    // push 2, pushpop2, pop 2
    pop = 0;
    push = 1;
    data_in = 6'd10;
    #2
    push = 1;
    data_in = 6'd12;
    #2
    pop = 0;
    push = 1;
    data_in = 6'd15;
    //rd_sel = 4'b0001;
    #2
    pop = 1;
    push = 0;
    //data_in = 6'd17;
    rd_sel = 4'b0010;
    #2
    pop = 1;
    push = 1;
    data_in = 6'd18;
    rd_sel = 4'b1000;
    #2
    pop = 1;
    push = 0;
    rd_sel = 4'b0001;
    #2
    pop = 1;
    push = 0;
    rd_sel = 4'b0010;
    #2
    pop = 1;
    push = 0;
    rd_sel = 4'b0010;
    #2
    pop = 1;
    push = 0;
    rd_sel = 4'b0001;
    #2
    //push 3, pushpop 3, pop 3
    pop = 1;
    push = 0;
    rd_sel = 4'b0001;
    #2
    push = 1;
    pop = 1;
    data_in = 6'd1;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0100;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd2;
    #2
    push = 1;
    pop = 1;
    rd_sel = 4'b1000;
    data_in = 6'd3;
    #2
    push = 1;
    pop = 1;
    rd_sel = 4'b0010;
    data_in = 6'd4;
    #2
    // push 4, pushpop 4, pop 4
    push = 1;
    pop = 0;
    data_in = 6'd5;
    #2
    push = 1;
    pop = 1;
    data_in =  6'd6;
    rd_sel = 4'b0001;
    #2
    push = 1;
    pop = 1;
    data_in = 6'd8;
    rd_sel = 4'b1000;
    #2
    push = 1;
    pop = 1;
    data_in = 6'd10;
    rd_sel = 4'b0010;
    #2
    push = 0;
    pop = 1;
    //data_in = 6'd8;
    rd_sel = 4'b0001;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd7;
    #2
    push = 1;
    pop = 1;
    data_in = 6'd8;
    rd_sel = 4'b1000;
    #2
    push = 1;
    pop = 0;
    data_in =  6'd9;
    #2
    push = 1;
    pop = 1;
    data_in =  6'd12;
    rd_sel = 4'b0010;
    #2
    pop = 1;
    push = 0;
    rd_sel = 4'b0100;
    #2
    push = 0;
    pop = 1;
    data_in = 6'd10;
    rd_sel = 4'b0001;
    #2
    pop = 1;
    data_in = 6'd39;
    rd_sel = 4'b0001;
    #2
    push = 1;
    pop = 0;
    data_in = 6'd36;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0010;
    #2
    pop = 1;
    push = 1;
    data_in = 6'd19;
    rd_sel = 4'b0001;
    #2
    push = 0;
    pop = 1;
    rd_sel = 4'b0001;
    #2
    pop = 1;
    push = 1;
    data_in = 6'd20;
    rd_sel = 4'b0001;
    #2
    pop = 1;
    push = 0;
    rd_sel = 4'b0001;
    #2
    push = 1;
    pop = 1;
    data_in = 6'd21;
    #2 
    push = 0;
    pop = 0;
end
always #1 clk = !clk;
endmodule
