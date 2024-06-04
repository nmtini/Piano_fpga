`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2024 13:57:35
// Design Name: 
// Module Name: Keyboard_in
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

module Keyboard_in(
    input clk, kdata, kclk,
    output reg [7:0] ps2_dreg,
    output reg new_key // indicates new key pressed
    );
       
    // counter for receiving serial ps2 data, max at 11
    reg [3:0] ps2_counter;
    reg [10:0] ps2_in;
    
    initial
        begin
            ps2_counter <= 4'b0000;
            ps2_in <= 11'b00000000000;
        end
    
    debouncer debounce(
        .clk(clk),
        .I0(kclk),
        .I1(kdata),
        .O0(kclkd),
        .O1(kdatad)
        );
    
    always @ (negedge kclkd) begin
        
        ps2_in[ps2_counter] = kdatad;
        ps2_counter = ps2_counter + 1;
        
        if (ps2_counter == 10) new_key = 1'b0;
        
        if (ps2_counter == 11) begin
            ps2_dreg[7:0] = ps2_in[8:1]; // push data out
            ps2_counter = 4'b0000;
            new_key = 1'b1;
        end
        
    end
    
endmodule
