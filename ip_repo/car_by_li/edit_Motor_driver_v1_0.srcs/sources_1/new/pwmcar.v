`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 16:40:09
// Design Name: 
// Module Name: PWM_CAR_Controller
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


module PWM_CAR_Controller_li(
    input clk,
    input [7:0] data,
    output reg enable,
    output reg latch,
    output reg serial
    );
    
    reg [31:0] state = 0;
    reg [31:0] buff = 0;
    
    always @ (negedge clk)
        case (state)
        0:
            begin
                buff <= data;
                state <= 1;
                serial <= data[0];
                enable <= 1;
                latch  <= 0;
            end
        1:
            begin
                state <= 2;
                serial <= data[1];
                enable <= 1;
                latch  <= 0;
            end
        2:
            begin
                state <= 3;
                serial <= data[2];
                enable <= 1;
                latch  <= 0;
            end
        3:
            begin
                state <= 4;
                serial <= data[3];
                enable <= 1;
                latch  <= 0;
            end
        4:
            begin
                state <= 5;
                serial <= data[4];
                enable <= 1;
                latch  <= 0;
            end
        5:
            begin
                state <= 6;
                serial <= data[5];
                enable <= 1;
                latch  <= 0;
            end
        6:
            begin
                state <= 7;
                serial <= data[6];
                enable <= 1;
                latch  <= 0;
            end
        7:
            begin
                state <= 8;
                serial <= data[7];
                enable <= 1;
                latch  <= 0;
            end
        8:
            begin
                state <= !(data^buff)?8:0;
                serial <= data[7];
                enable <= 0;
                latch  <= 1;
            end         
        endcase
endmodule
