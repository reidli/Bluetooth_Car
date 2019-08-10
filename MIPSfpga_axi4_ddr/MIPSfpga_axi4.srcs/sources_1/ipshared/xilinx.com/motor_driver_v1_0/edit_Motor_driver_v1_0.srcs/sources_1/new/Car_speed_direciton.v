`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/16 16:41:10
// Design Name: 
// Module Name: Car_speed_direciton
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


module Car_speed_direciton(
    input clk,
    input [31:0] lf_data,
    input [31:0] lb_data,
    input [31:0] rf_data,
    input [31:0] rb_data,
    output reg pwm2A,
    output reg pwm2B,
    output reg pwm0A,
    output reg pwm0B,
    output reg [7:0] signal
    );
    reg [31:0] counter = 0;
    always @(negedge clk)
    begin
        if(counter==500)counter = 0;
        else counter = counter+1;
        //left front
        if ( lf_data == 0 )
            begin
                signal[2]<=0;
                signal[0]<=0;
            end
        else
            begin 
                if(lf_data[31]==0)
                begin
                signal[2]<=1;
                signal[0]<=0;
                if(counter<lf_data) pwm0A<=1;
                else pwm0A<=0;
            end
        else 
            begin//negative num
                signal[2]<=0;
                signal[0]<=1;
                if(counter<(~lf_data+1)) pwm0A<=1;
                else pwm0A<=0;
            end
        end
        //left back
        if ( lb_data == 0 )
            begin
                signal[3]<=0;
                signal[6]<=0;
            end
        else
            begin
                if(lb_data[31]==0)
                    begin
                        signal[3]<=1;
                        signal[6]<=0;
                        if(counter<lb_data) pwm2B<=1;
                        else pwm2B<=0;
                    end
                else 
                    begin//negative num
                        signal[3]<=0;
                        signal[6]<=1;
                        if(counter<(~lb_data+1)) pwm2B<=1;
                        else pwm2B<=0;
                    end
            end
        //right front
        if ( rf_data == 0 )
            begin
                signal[1]<=0;
                signal[7]<=0;
            end
        else
            begin
                if(rf_data[31]==0)
                    begin
                        signal[1]<=1;
                        signal[7]<=0;
                        if(counter<rf_data) pwm0B<=1;
                        else pwm0B<=0;
                    end
                else 
                    begin//negative num
                        signal[1]<=0;
                        signal[7]<=1;
                        if(counter<(~rf_data+1)) pwm0B<=1;
                        else pwm0B<=0;
                    end
            end
        if ( rb_data == 0 )
            begin
                signal[5]<=0;
                signal[4]<=0;
            end
        else
            begin
                if(rb_data[31]==0)
                    begin
                        signal[5]<=1;
                        signal[4]<=0;
                        if(counter<rb_data) pwm2A<=1;
                        else pwm2A<=0;
                    end
                else 
                    begin//negative num
                        signal[5]<=0;
                        signal[4]<=1;
                        if(counter<(~rb_data+1)) pwm2A<=1;
                        else pwm2A<=0;
                    end
            end
    end
endmodule
