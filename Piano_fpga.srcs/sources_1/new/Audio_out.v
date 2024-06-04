`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2024 13:57:35
// Design Name: 
// Module Name: Audio_out
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


module Audio_out(
    input clk, new_key,
    input [7:0] keycode,
    output reg AUD_PWM, AUD_SD
    );
    
    reg [7:0] curr_key;
    reg [7:0] prev_key;
    reg key_change;
    reg [9:0] freq;
    
    reg [20:0] count_target;
    reg [20:0] counter;
    reg [20:0] duty_target;
    reg [20:0] duty_counter;
    reg freq_set;
    
    initial
        begin
            AUD_SD = 1'b1; // enable port
            counter = 21'd0;
            duty_counter = 21'd0;
            curr_key = 8'h00;
            prev_key = 8'h00;
            AUD_PWM = 1'b0;
            key_change = 1'b1;
        end
        
    always @ (posedge clk)
        begin
            
            if (new_key == 1'b0)
                key_change <= 1'b1; // new key becomes zero when about to output new frame so key will change
            
            if ((new_key == 1'b1) && (key_change == 1'b1)) begin
                prev_key = curr_key;
                curr_key = keycode;
                key_change <= 1'b0;
                freq_set <= 1'b1;
                
                if (prev_key == 8'hF0) begin
                    curr_key = 8'h00;
                end
            end
            
            
            
            // set frequency
            case (curr_key)
                8'h15: freq = 10'd987;
                8'h1D: freq = 10'd880;
                8'h24: freq = 10'd784; 
                8'h2D: freq = 10'd698; 
                8'h2C: freq = 10'd659; 
                8'h35: freq = 10'd587; 
                8'h3C: freq = 10'd523; 
                8'h43: freq = 10'd494; 
                8'h44: freq = 10'd440; 
                8'h4D: freq = 10'd392; 
                8'h1C: freq = 10'd349; 
                8'h1B: freq = 10'd329; 
                8'h23: freq = 10'd293; 
                8'h2B: freq = 10'd261;  //F key middle c
                8'h34: freq = 10'd247; 
                8'h33: freq = 10'd220; 
                8'h3B: freq = 10'd196; 
                8'h42: freq = 10'd174; 
                8'h4B: freq = 10'd164; 
                8'h1A: freq = 10'd146; 
                8'h22: freq = 10'd130; 
                8'h21: freq = 10'd123; 
                8'h2A: freq = 10'd110; 
                8'h32: freq = 10'd98; 
                8'h31: freq = 10'd87;
                8'h3A: freq = 10'd82;
                default: AUD_SD = 1'b0;
            endcase
            
            if (freq_set == 1'b1) begin
                count_target = 32'd100000000/(freq); 
                freq_set = 1'b0;
                AUD_SD = 1'b1;
            end
            
            if (counter >= count_target) begin
                counter <= 21'd0;
            end else begin
                counter <= counter + 1'b1;    
            end
            
            duty_target = (counter*100)/count_target; // find ratio to determine "height" of current window
            // set pwm length
            if (duty_target <= 10) duty_target = 100;
            else if (duty_target <= 20) duty_target = 80;
            else if (duty_target <= 30) duty_target = 60;
            else if (duty_target <= 40) duty_target = 40;
            else if (duty_target <= 50) duty_target = 20;
            else if (duty_target <= 60) duty_target = 0;
            else if (duty_target <= 70) duty_target = 20;
            else if (duty_target <= 80) duty_target = 40;
            else if (duty_target <= 90) duty_target = 60;
            else if (duty_target <= 100) duty_target = 80;
            
            // could multiply duty target by (number of switches on/total switches)
            // to change volume I believe
            if (duty_counter <= duty_target) begin 
                AUD_PWM <= 1'b1;
                duty_counter <= duty_counter + 1'b1;
            end else begin
                AUD_PWM <= 1'b0;
                duty_counter <= duty_counter + 1'b1;
            end
            
            if (duty_counter >= 100) duty_counter <= 21'd0;
            
        end //always
            
endmodule