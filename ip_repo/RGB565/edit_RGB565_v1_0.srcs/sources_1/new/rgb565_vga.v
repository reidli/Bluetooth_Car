`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/26 11:10:59
// Design Name: 
// Module Name: rgb565_vga
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


module rgb565_vga(
       input pclk,
       input [7:0]data,
       
       //vga out
       output reg [4:0]R,
       output reg [5:0]G,
       output reg [4:0]B,
       output reg rclk
    );
    reg counter;
    
    initial 
        begin 
            counter<=0;
            R<=0;
            G<=0;
            B<=0;
            rclk<=0;
        end
    
    
    always @(posedge pclk)
    begin
        if(count==0)
        begin
            R <= data[7:3];
            G[5:3] <= data[2:0];
            rclk<= ~rclk;
        end
        else
        begin
            G[2:0] <= data[7:5]; 
            B <= data[4:0];
        end
        counter <= counter + 1;
    end
    
endmodule
