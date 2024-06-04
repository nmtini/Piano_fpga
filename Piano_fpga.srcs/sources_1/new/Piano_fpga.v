`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2024 13:57:35
// Design Name: 
// Module Name: Piano
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


module Piano(
    input CLK100MHZ, PS2_CLK, PS2_DATA,
    output [7:0] AN,
    output [6:0] SEG,
    output DP,
    output reg [15:0] LED,
    output AUD_SD, AUD_PWM
    );
    
    wire new_key;
    
    wire [7:0] ps2_dreg;
    reg CLK50MHZ = 0;
    
    always @(posedge CLK100MHZ)
        begin
            CLK50MHZ <= ~CLK50MHZ;
            LED <= ps2_dreg;
            
        end
    
    Keyboard_in keyboard(
        .clk(CLK50MHZ),
        .kdata(PS2_DATA),
        .kclk(PS2_CLK),
        .ps2_dreg(ps2_dreg[7:0]),
        .new_key(new_key)
    );
    
    seg7decimal ss(
        .x({24'b111111111111111111111111,ps2_dreg[7:0]}),
        .clk(CLK100MHZ),
        .seg(SEG[6:0]),
        .an(AN[7:0]),
        .dp(DP)
    );
    
    Audio_out aud_out(
        .clk(CLK100MHZ),
        .keycode(ps2_dreg[7:0]),
        .AUD_PWM(AUD_PWM),
        .AUD_SD(AUD_SD),
        .new_key(new_key)
    );
    
    
endmodule