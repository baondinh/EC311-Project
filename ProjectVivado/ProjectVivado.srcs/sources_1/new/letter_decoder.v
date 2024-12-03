`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 01:56:20 PM
// Design Name: 
// Module Name: letter_decoder
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


module letter_decoder (
    input [1:0] tilt_input,    // 2-bit tilt input
    input [3:0] switch_input,  // 4-bit switch input
    output reg [7:0] letter    // ASCII code
);
    always @(*) begin
        case ({tilt_input, switch_input}) 
            6'b000000: letter = 8'd97;    // 'a'
            6'b000001: letter = 8'd98;    // 'b'
            6'b000010: letter = 8'd99;    // 'c'
            6'b000011: letter = 8'd100;   // 'd'
            6'b000100: letter = 8'd101;   // 'e'
            6'b000101: letter = 8'd102;   // 'f'
            6'b000110: letter = 8'd103;   // 'g'
            6'b000111: letter = 8'd104;   // 'h'
            6'b001000: letter = 8'd105;   // 'i'
            6'b001001: letter = 8'd106;   // 'j'
            6'b001010: letter = 8'd107;   // 'k'
            6'b001011: letter = 8'd108;   // 'l'
            6'b001100: letter = 8'd109;   // 'm'
            6'b001101: letter = 8'd110;   // 'n'
            6'b001110: letter = 8'd111;   // 'o'
            6'b001111: letter = 8'd112;   // 'p'
            6'b010000: letter = 8'd113;   // 'q'
            6'b010001: letter = 8'd114;   // 'r'
            6'b010010: letter = 8'd115;   // 's'
            6'b010011: letter = 8'd116;   // 't'
            6'b010100: letter = 8'd117;   // 'u'
            6'b010101: letter = 8'd118;   // 'v'
            6'b010110: letter = 8'd119;   // 'w'
            6'b010111: letter = 8'd120;   // 'x'
            6'b011000: letter = 8'd121;   // 'y'
            6'b011001: letter = 8'd122;   // 'z'
            default: letter = 8'd32;      // Default ' ' if invalid
        endcase
    end
endmodule


