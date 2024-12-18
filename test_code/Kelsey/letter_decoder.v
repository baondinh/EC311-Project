
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
   
    input [5:0] switch_input,// 6-bit switch input
    output reg [5:0]letter1,// First letter
    output reg [5:0]letter2,// Second letter
    output reg [5:0]letter3// Third letter
);
    reg [5:0]letter_buffer; // new inputed letter
    reg [1:0] current_position = 0; // Keeps track of letter slot index
    reg flagDel = 0;
    reg flagEN = 0;
//    initial begin
//        reg flagDel = 0;
//        reg flagEN = 0;
//        reg [5:0]letter_buffer = 0 ; // new inputed letter
//        reg [1:0] current_position = 0; // Keeps track of letter slot index
//        letter1 = 0;
//        letter2 = 0;
//        letter3 = 0;
//    end
    
// Letter decoder
always @(*) begin
    case (switch_input)  // Concatenate tilt_input and switch_input
        6'b000000: letter_buffer = 6'b000000; // ASCII 97
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
        6'b001101: letter_buffer = 6'b001101; // ASCII 110
        6'b001110: letter_buffer = "o"; // ASCII 111
        6'b001111: letter_buffer = "p"; // ASCII 112
        6'b010000: letter_buffer = "q"; // ASCII 113
        6'b010001: letter_buffer = "r"; // ASCII 114
        6'b010010: letter_buffer = "s"; // ASCII 115
        6'b010011: letter_buffer = 6'b010011; // ASCII 116
        6'b010100: letter_buffer = "u"; // ASCII 117
        6'b010101: letter_buffer = "v"; // ASCII 118
        6'b010110: letter_buffer = "w"; // ASCII 119
        6'b010111: letter_buffer = "x"; // ASCII 120
        6'b011000: letter_buffer = "y"; // ASCII 121
        6'b011001: letter_buffer = "z"; // ASCII 122
        default: letter_buffer = 6'b111111;   // Default to space
    endcase
end

//// Letter decoder
//always @(*) begin
//    case (switch_input)  // Concatenate tilt_input and switch_input
//        6'b000000: letter_buffer = 6'b000000; // ASCII 97
//        6'b000001: letter_buffer = 6'b000001; // ASCII 98
//        6'b000010: letter_buffer = 6'b000010; // ASCII 99
//        6'b000011: letter_buffer = 6'b000011; // ASCII 100
//        6'b000100: letter_buffer = 6'b000100; // ASCII 101
//        6'b000101: letter_buffer = 6'b000101; // ASCII 102
//        6'b000110: letter_buffer = 6'b000110; // ASCII 103
//        6'b000111: letter_buffer = 6'b000111; // ASCII 104
//        6'b001000: letter_buffer = 6'b001000; // ASCII 105
//        6'b001001: letter_buffer = 6'b001001; // ASCII 106
//        6'b001010: letter_buffer = 6'b001010; // ASCII 107
//        6'b001011: letter_buffer = 6'b001011; // ASCII 108
//        6'b001100: letter_buffer = 6'b001100; // ASCII 109
//        6'b001101: letter_buffer = 6'b001101; // ASCII 110
//        6'b001110: letter_buffer = 6'b001110; // ASCII 111
//        6'b001111: letter_buffer = 6'b001111; // ASCII 112
//        6'b010000: letter_buffer = 6'b010000; // ASCII 113
//        6'b010001: letter_buffer = 6'b010001; // ASCII 114
//        6'b010010: letter_buffer = 6'b010010; // ASCII 115
//        6'b010011: letter_buffer = 6'b010011; // ASCII 116
//        6'b010100: letter_buffer = 6'b010100; // ASCII 117
//        6'b010101: letter_buffer = 6'b010101; // ASCII 118
//        6'b010110: letter_buffer = 6'b010110; // ASCII 119
//        6'b010111: letter_buffer = 6'b010111; // ASCII 120
//        6'b011000: letter_buffer = 6'b011000; // ASCII 121
//        6'b011001: letter_buffer = 6'b011001; // ASCII 122
//        default: letter_buffer = 6'b000000;   // Default to space
//    endcase
//end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            letter1 <= " ";
            letter2 <= " ";
            letter3 <= " ";
            current_position <= 2'b00;
        end
        
        if (en & ~flagEN) begin
            // Add a new letter to the next available position
            $display("TESTING TESTING");
            $display("current_position:", current_position);
            case (current_position)
                2'b00: begin
                    letter1 <= letter_buffer;
                    current_position <= 2'b01;
//                    flagEN = 1;
                end
                2'b01: begin
                    letter2 <= letter_buffer;
                    current_position <= 2'b10;
//                    flagEN = 1;
                end
                2'b10: begin
                    letter3 <= letter_buffer;
                    current_position <= 2'b10; // Stay at the last position
//                    flagEN = 1;
                end
            endcase
            flagEN = 1;
        end else if (~en) begin flagEN = 0;
        end 
        
        if (del & !flagDel) begin
        // Perform delete action based on current_position
            case (current_position)
                2'b10: begin
                    letter3 <= 6'b111111;          // Clear the third letter
                    current_position <= 2'b01; // Move position back to letter2
                end
                2'b01: begin
                    letter2 <= 6'b111111;          // Clear the second letter
                    current_position <= 2'b00; // Move position back to letter1
                end
                2'b00: begin
                    letter1 <= 6'b111111;          // Clear the first letter
                    current_position <= 2'b00; // Remain at the start (no letters to delete)
                end
            endcase
            flagDel = 1; // Set the flag to indicate delete action is in progress
        end else if (!del) begin
            flagDel = 0; // Reset the flag when delete button is released
        end


// Sequential Logic for Buffer Management
//always @(posedge clk or posedge rst) begin
//        if (rst) begin
//            letter1 <= " ";
//            letter2 <= " ";
//            letter3 <= " ";
//            current_position <= 2'b00;
////        end else if (en & ~flagEN) begin
//        end else if (en) begin
//            // Add a new letter to the next available position
//            $display("TESTING TESTING");
//            $display("current_position:", current_position);
//            case (current_position)
//                2'b00: begin
//                    letter1 <= letter_buffer;
//                    current_position <= 2'b01;
////                    flagEN = 1;
//                end
//                2'b01: begin
//                    letter2 <= letter_buffer;
//                    current_position <= 2'b10;
////                    flagEN = 1;
//                end
//                2'b10: begin
//                    letter3 <= letter_buffer;
//                    current_position <= 2'b10; // Stay at the last position
////                    flagEN = 1;
//                end
//            endcase
//    end else if (del && !flagDel) begin
//        // Perform delete action based on current_position
//        case (current_position)
//            2'b10: begin
//                letter3 <= " ";          // Clear the third letter
//                //current_position <= 2'b01; // Move position back to letter2
//            end
//            2'b01: begin
//                letter2 <= " ";          // Clear the second letter
//                current_position <= 2'b00; // Move position back to letter1
//            end
//            2'b00: begin
//                letter1 <= " ";          // Clear the first letter
//                current_position <= 2'b00; // Remain at the start (no letters to delete)
//            end
//        endcase

//        flagDel <= 1'b1; // Set the flag to indicate delete action is in progress
//    end else if (!del) begin
//        flagDel <= 1'b0; // Reset the flag when delete button is released
//    end

        //end else if (~en) begin flagEN = 0; 
        end
endmodule