`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2023 08:34:15 PM
// Design Name: 
// Module Name: queue_data
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2023 08:34:15 PM
// Design Name: 
// Module Name: queue_data
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


module queue_data( 
input clk,
input rst_n,
input [5:0] data_in,
input [1:0] dec_rd_sel_o,
input [1:0] flag,
output reg [5:0] data_out,
output reg full,
output reg empty
    );
parameter QUEUE_DEPTH = 3'd4,
          DATA_WIDTH = 3'd6;
reg [DATA_WIDTH - 1 : 0] dat [0: QUEUE_DEPTH - 1];// memory
reg [2 : 0] rear = 3'd0;
reg [2 : 0] i = 3'd0;
reg [2 : 0] mem1 = 3'd0;


always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
begin
    /*for(i = 0; i < QUEUE_DEPTH; i = i + 1)
    begin
        dat[i] <= 6'b000000; 
    end*/
    dat[0] <= 6'b000000;
    dat[1] <= 6'b000000;
    dat[2] <= 6'b000000;
    dat[3] <= 6'b000000;

    full <= 0;
    empty <= 1;
    data_out <= 6'b000000;
    mem1 <= 0;
    rear <= 0;
end
else
begin
if(flag == 2'b01 || (flag == 2'b11 && dat[dec_rd_sel_o] == 0))
begin
    mem1 <= rear;
end
else if(flag == 2'b10)
begin
    if(rear > 1)
        mem1 <= rear - 2;
    else if(rear == 1)
    begin
        mem1 <= rear - 1;
    end
    else
        mem1 <= rear;
end
else
    mem1 <= mem1;
case(flag)
    2'b00:
    begin
        data_out <= 6'b000000;
    end
    2'b01: // PUSH
    begin
        data_out <= 6'b000000;
        if(rear < QUEUE_DEPTH - 1)
        begin
            dat[rear] <= data_in;
            rear <= rear + 1;
            full <= 0;
            empty <= 0;
        end
        else if(rear == QUEUE_DEPTH - 1)
        begin
            dat[rear] <= data_in;
            rear <= rear + 1;
            full <= 1;
            empty <= 0;
        end
        else
        begin 
            full <= 1;
            empty <= 0;
        end
    end
    2'b10:// POP
    begin
        if(dat[dec_rd_sel_o] == 0)
        begin
            rear <= rear;
            data_out <= 0;
        end
        else
        begin
            rear <= rear - 1;
            if(rear > 1)
            begin
                data_out <= dat[dec_rd_sel_o];
                i <= 0;
                for(i = 0; i < QUEUE_DEPTH; i = i + 1)
                begin
                    if(i >= dec_rd_sel_o && i < QUEUE_DEPTH - 1)
                    begin
                        dat[i] <= dat[i + 1];
                        empty <= 0;
                        full <= 0;
                    end
                    else if(i == QUEUE_DEPTH - 1)
                    begin
                        dat[i] <= 0;
                        empty <= 0;
                        full <= 0;
                    end
                    else
                    begin
                        empty <= 0;
                        full <= 0;
                    end
                end
        /*if(rear == 0)
        begin
            empty = 1;
            full = 0;
        end
        else
        begin
            empty = 0;
            full = 0;
        end*/
        end
            else if(rear == 1)
            begin
                if(dec_rd_sel_o == 0)
                begin
                    data_out <= dat[dec_rd_sel_o];
                    dat[dec_rd_sel_o] <= 0;
                    empty <= 1;
                    full <= 0;
                end
                else
                begin
                    data_out <= 0;
                    empty <= 0;
                    full <= 0;
                end
            end
            else
            begin
                empty <= 1;
                full <= 0;
            end    
        end
    end
    default:
    begin
        // POP FIRST
        if(dat[dec_rd_sel_o] == 0)
        begin
            data_out <= 6'b000000;
            if(rear < QUEUE_DEPTH - 1)
            begin
                dat[rear] <= data_in;
                rear <= rear + 1;
                full <= 0;
                empty <= 0;
            end
            else if(rear == QUEUE_DEPTH - 1)
            begin
                dat[rear] <= data_in;
                rear <= rear + 1;
                full <= 1;
                empty <= 0;
            end
            else
            begin 
                full <= 1;
                empty <= 0;
            end
        end
        else
        begin
            if(rear != 0)
            begin
                data_out <= dat[dec_rd_sel_o];
                i <= 0;
                for(i = 0; i < QUEUE_DEPTH; i = i + 1)
                begin
                    if(i >= dec_rd_sel_o && i < QUEUE_DEPTH - 1)
                    begin
                        dat[i] <= dat[i + 1];
                    end
                    else if(i == QUEUE_DEPTH - 1)
                    begin
                        dat[i] <= 0;
                    end
                    else
                    begin
                        empty <= 0;
                    end
                end
            end
            /*else if(rear == QUEUE_DEPTH)
            begin
                data_out <= dat[dec_rd_sel_o];
                i <= 0;
                for(i = 0; i < QUEUE_DEPTH; i = i + 1)
                begin
                    if(i >= dec_rd_sel_o && i < QUEUE_DEPTH - 1)
                    begin
                        dat[i] <= dat[i + 1];
                        full <= 1;
                    end
                    else if(i == QUEUE_DEPTH - 1)
                    begin
                        dat[i] <= 0;
                        full <= 1;
                    end
                    else
                    begin
                        empty <= 0;
                    end
                end
            end*/
            else
            begin
                empty <= 1;
                full <= 0;
            end
        // PUSH 
            if(mem1 < QUEUE_DEPTH - 1)
                begin
                dat[mem1] <= data_in;
                full <= 0;
                empty <= 0;
            end
            else if(mem1 == QUEUE_DEPTH - 1)
            begin
                dat[mem1] <= data_in;
                full <= 1;
                empty <= 0;
            end
            else
            begin
                full <= 1;
                empty <= 0;
            end
        end
    end
    endcase
end 
end
endmodule