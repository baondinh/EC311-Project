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

    // Sequential logic for managing letters
module letter_decoder (
    input clk,// Clock signal
    input rst,// Reset signal (clears everything)
    input en,// Enable signal for input
    input del,// Delete signal
    input [1:0] tilt_input,// 2-bit tilt input
    input [3:0] switch_input,// 4-bit switch input
    output reg [7:0] letter1,// First letter
    output reg [7:0] letter2,// Second letter
    output reg [7:0] letter3// Third letter
);
    reg [7:0] letter_buffer; // new inputed letter
    reg [1:0] current_position; // Keeps track of letter slot index
    
//    reg flagDel = 0;
//    reg flagEN = 0;
    
// Letter decoder
always @(*) begin
    case ({tilt_input, switch_input})  // Concatenate tilt_input and switch_input
        6'b000000: letter_buffer = "a"; // ASCII 97
        6'b000001: letter_buffer = "b"; // ASCII 98
        6'b000010: letter_buffer = "c"; // ASCII 99
        6'b000011: letter_buffer = "d"; // ASCII 100
        6'b000100: letter_buffer = "e"; // ASCII 101
        6'b000101: letter_buffer = "f"; // ASCII 102
        6'b000110: letter_buffer = "g"; // ASCII 103
        6'b000111: letter_buffer = "h"; // ASCII 104
        6'b001000: letter_buffer = "i"; // ASCII 105
        6'b001001: letter_buffer = "j"; // ASCII 106
        6'b001010: letter_buffer = "k"; // ASCII 107
        6'b001011: letter_buffer = "l"; // ASCII 108
        6'b001100: letter_buffer = "m"; // ASCII 109
        6'b001101: letter_buffer = "n"; // ASCII 110
        6'b001110: letter_buffer = "o"; // ASCII 111
        6'b001111: letter_buffer = "p"; // ASCII 112
        6'b010000: letter_buffer = "q"; // ASCII 113
        6'b010001: letter_buffer = "r"; // ASCII 114
        6'b010010: letter_buffer = "s"; // ASCII 115
        6'b010011: letter_buffer = "t"; // ASCII 116
        6'b010100: letter_buffer = "u"; // ASCII 117
        6'b010101: letter_buffer = "v"; // ASCII 118
        6'b010110: letter_buffer = "w"; // ASCII 119
        6'b010111: letter_buffer = "x"; // ASCII 120
        6'b011000: letter_buffer = "y"; // ASCII 121
        6'b011001: letter_buffer = "z"; // ASCII 122
        default: letter_buffer = " ";   // Default to space
    endcase
end

// Sequential Logic for Buffer Management
always @(posedge clk or posedge rst) begin
        if (rst) begin
            letter1 <= " ";
            letter2 <= " ";
            letter3 <= " ";
            current_position <= 2'b00;
//        end else if (en & ~flagEN) begin
        end else if (en) begin
            // Add a new letter to the next available position
            case (current_position)
                2'b00: begin
                    letter1 <= letter_buffer;
                    current_position <= 2'b01;
 //                   flagEN = 1;
                end
                2'b01: begin
                    letter2 <= letter_buffer;
                    current_position <= 2'b10;
 //                   flagEN = 1;
                end
                2'b10: begin
                    letter3 <= letter_buffer;
                    current_position <= 2'b10; // Stay at the last position
//                    flagEN = 1;
                end
            endcase
//       end else if (del & ~flagDel) begin
       end else if (del) begin
            // Delete the last entered letter
            case (current_position)
                2'b10: begin
                    letter3 <= " ";
                    current_position <= 2'b01;
//                    flagDel = 1;
                end
                2'b01: begin
                    letter2 <= " ";
                    current_position <= 2'b00;
//                    flagDel = 1;
                end
                2'b00: begin
                    letter1 <= " ";
                    current_position <= 2'b00; // No more letters to delete
//                    flagDel = 1;
                end
            endcase end
 //       end else if (~del) begin flagDel = 0;
//        end else if (~en) begin flagEN = 0; end
    end
endmodule




