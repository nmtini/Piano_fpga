`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2024 00:47:25
// Design Name: 
// Module Name: Piano_tb
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


module Piano_tb(

    );
    
    reg clk;
    reg PS2_CLK;
    reg data;
    wire [7:0] AN;
    wire [6:0] SEG;
    wire DP;
    wire [15:0] LED;
    wire AUD_PWM, AUD_SD;
    
    
    Piano DUT(
    .CLK100MHZ(clk),
    .PS2_CLK(PS2_CLK),
    .PS2_DATA(data),
    .AN(AN),
    .SEG(SEG),
    .DP(DP),
    .LED(LED),
    .AUD_SD(AUD_SD),
    .AUD_PWM(AUD_PWM)
    );
    
    initial
        begin
        
        clk <= 1'b0;
        data <= 1'bz;
        PS2_CLK <= 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b1;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b1;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b1;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        // input two
        #400;
        #300 data = 1'b1;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b1;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b1;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b1;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #1000 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        end
    initial forever #1 clk = ~clk;
endmodule
