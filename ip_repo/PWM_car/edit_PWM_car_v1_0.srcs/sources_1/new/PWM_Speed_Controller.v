`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 20:16:24
// Design Name: 
// Module Name: PWM_Speed_Controller
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


module PWM_Speed_Controller(
	    input clk,
        input[5:0] data,
        output reg out
    );
    reg [3:0] counter;
    initial 
    begin
        out <= 0;
        counter <= 0;
    end
    
    always @ (negedge clk)
    begin

        if(counter==9) counter <= 0;
        else           counter <= counter + 1;

        case(data)
            6'b000000:
            begin
                out <= 0;
            end
            6'b000001:
            begin
                if(counter<2)  out <= 1;
                else           out<=0;
            end
            6'b000010:
            begin
                if(counter<4)  out <= 1;
                else           out<=0;
            end
            6'b000100:
            begin
                if(counter<5)  out <= 1;
                else           out<=0;
            end
            6'b001000:
            begin
                if(counter<6)  out <= 1;
                else           out<=0;
            end
            6'b010000:
            begin
                if(counter<8)  out <= 1;
                else           out<=0;
            end
            6'b100000:
            begin
                out <= 1;
            end
            default:
            begin
                out <= 0;
            end
        endcase
    end
    
endmodule
