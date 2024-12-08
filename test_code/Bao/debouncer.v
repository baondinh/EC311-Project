`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 05:42:28 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input clk, trigger, 
    output reg clean = 0
    );
    // Use low max to show behavioral waveform
//    parameter max = 10;
    parameter max = 1000000;
    reg output_flag = 0;
    reg [31:0] counter = 0;
    
    always @(posedge clk) begin
        $display ("counter: ", counter);
        if (trigger) begin
            if (~output_flag) begin
                if (counter >= max) begin
                    // Set flag and clean output
                    clean <= 1; 
                    output_flag <= 1;
                end else counter = counter + 1; 
            end else begin //At next clock edge while trigger remains pressed down, update output clean 
                clean = 0;
            end
        end else begin // No button signal, reset counter and output flag
            output_flag = 0; 
            counter = 0;
        end    
    end
endmodule
