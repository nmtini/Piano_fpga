`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2024 05:06:08 PM
// Design Name: 
// Module Name: Audio_tb
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


module Audio_tb(

    );
    
    reg CLK;
    wire pwm;
    wire sd;
    reg [7:0] keycode;
    
    Audio_out DUT(
        .clk(CLK),
        .AUD_PWM(pwm),
        .AUD_SD(sd),
        .keycode(keycode)
    );
    
    initial begin
        CLK <= 1'b1;
        
        keycode = 8'h32;
//        #300 keycode = 8'hF0;
//        #300 keycode = 8'h32;
//        #300 keycode = 8'h33;
    end
    
    initial forever #1 CLK = ~CLK;
    
    
    
endmodule
