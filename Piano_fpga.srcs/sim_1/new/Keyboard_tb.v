`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2024 17:07:05
// Design Name: 
// Module Name: Keyboard_tb
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


module Keyboard_tb(
    
    );
    
    reg clk;
    reg data;
    reg PS2_CLK;
    wire [7:0] key;
    
    Keyboard_in DUT(
    .clk(clk),
    .kdata(data),
    .kclk(PS2_CLK),
    .ps2_dreg(key)
    );
    
    initial
        begin
        clk <= 1'b0;
        data <= 1'bz;
        PS2_CLK <= 1'b1;
        
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
//        #200 PS2_CLK = 1'b0;
//        #200 PS2_CLK = 1'b1;
        
        #300 data = 1'b0;
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
        
        #300 data = 1'b0;
        #100 PS2_CLK = 1'b0;
        #100 PS2_CLK = 1'b1;
        
        #300 data = 1'b1;
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
    
    initial #1000000000 $finish;
    
    
endmodule
