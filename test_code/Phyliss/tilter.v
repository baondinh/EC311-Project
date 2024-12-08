`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 07:26:21 PM
// Design Name: 
// Module Name: tilter
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


module tilter (
    input wire clk,                     // System clock
    input wire reset,                   // Reset signal
    input wire en,                      // Enable signal for adding letters
    input wire del,                     // Delete signal for removing letters
    input wire [1:0] tilt_input,        // 2-bit tilt input
    input wire [2:0] switch_input,      // 3-bit switch input (for 26 letters)
    output reg [7:0] letter1,           // First letter in buffer
    output reg [7:0] letter2,           // Second letter in buffer
    output reg [7:0] letter3            // Third letter in buffer
);

    // Internal signals
    reg [7:0] letter_buffer;            // Temporary storage for the current letter
    reg [1:0] current_position;         // Tracks number of letters in buffer (0 to 3)
    reg flagEN;                         // Prevents multiple triggers from the same enable
    reg flagDel;                        // Prevents multiple triggers from the same delete

    // Letter Decoder Logic for 26 Letters
    always @(*) begin
        case ({tilt_input, switch_input})  // Combine tilt and switch inputs
            5'b00000: letter_buffer = "A";  // ASCII 65
            5'b00001: letter_buffer = "B";  // ASCII 66
            5'b00010: letter_buffer = "C";  // ASCII 67
            5'b00011: letter_buffer = "D";  // ASCII 68
            5'b00100: letter_buffer = "E";  // ASCII 69
            5'b00101: letter_buffer = "F";  // ASCII 70
            5'b00110: letter_buffer = "G";  // ASCII 71
            5'b00111: letter_buffer = "H";  // ASCII 72
            5'b01000: letter_buffer = "I";  // ASCII 73
            5'b01001: letter_buffer = "J";  // ASCII 74
            5'b01010: letter_buffer = "K";  // ASCII 75
            5'b01011: letter_buffer = "L";  // ASCII 76
            5'b01100: letter_buffer = "M";  // ASCII 77
            5'b01101: letter_buffer = "N";  // ASCII 78
            5'b01110: letter_buffer = "O";  // ASCII 79
            5'b01111: letter_buffer = "P";  // ASCII 80
            5'b10000: letter_buffer = "Q";  // ASCII 81
            5'b10001: letter_buffer = "R";  // ASCII 82
            5'b10010: letter_buffer = "S";  // ASCII 83
            5'b10011: letter_buffer = "T";  // ASCII 84
            5'b10100: letter_buffer = "U";  // ASCII 85
            5'b10101: letter_buffer = "V";  // ASCII 86
            5'b10110: letter_buffer = "W";  // ASCII 87
            5'b10111: letter_buffer = "X";  // ASCII 88
            5'b11000: letter_buffer = "Y";  // ASCII 89
            5'b11001: letter_buffer = "Z";  // ASCII 90
            default: letter_buffer = " ";    // Default to space if no match
        endcase
    end

    // Buffer Management Logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all buffers and positions
            letter1 <= " ";
            letter2 <= " ";
            letter3 <= " ";
            current_position <= 2'b00;
            flagEN <= 1'b0;
            flagDel <= 1'b0;
        end else begin
            if (en & ~flagEN) begin
                // Add a new letter to the next available position
                if (current_position < 2'b11) begin
                    case (current_position)
                        2'b00: letter1 <= letter_buffer;
                        2'b01: letter2 <= letter_buffer;
                        2'b10: letter3 <= letter_buffer;
                    endcase
                    current_position <= current_position + 1'b1;
                end
                flagEN <= 1'b1;  // Set enable flag
            end

            if (del & ~flagDel) begin
                // Delete the last entered letter
                if (current_position > 2'b00) begin
                    current_position <= current_position - 1'b1;
                    case (current_position - 1'b1)
                        2'b00: letter1 <= " ";
                        2'b01: letter2 <= " ";
                        2'b10: letter3 <= " ";
                    endcase
                end
                flagDel <= 1'b1;           // Set delete flag
            end

            // Clear flags when signals are inactive
            if (~en) begin
                flagEN <= 1'b0; // Clear enable flag when en is inactive
            end
            if (~del) begin
                flagDel <= 1'b0; // Clear delete flag when del is inactive
            end
        end
    end

endmodule
