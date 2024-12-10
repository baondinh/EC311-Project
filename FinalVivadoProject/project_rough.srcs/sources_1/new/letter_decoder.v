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
    input clk,// Clock signal
    input rst,// Reset signal (clears everything)
    input en,// Enable signal for input
    input del,// Delete signal
   
    input [5:0] switch_input,// 6-bit switch input
    input [1:0] tilt_input,  // Tilt input from accelerometer
    output reg [5:0]letter1,// First letter
    output reg [5:0]letter2,// Second letter
    output reg [5:0]letter3// Third letter
    );
    
    reg [5:0]letter_buffer; // new inputed letter
    reg [1:0] current_position; // Keeps track of letter slot index
    reg [1:0] last_inserted_position; // Tracks the last position a letter was inserted
    reg flagDel, flagEN;
    
    // NEW: Previous tilt input to detect changes
    reg [1:0] prev_tilt_input; 

    initial begin
        flagDel = 0;
        flagEN = 0;
        letter_buffer = 0 ; // new inputed letter
        current_position = 2'b00; // Keeps track of letter slot index
        last_inserted_position = 2'b00; // Initialize last inserted position to letter1
        letter1 = 6'b111111;
        letter2 = 6'b111111;
        letter3 = 6'b111111;
        prev_tilt_input = 2'b00; // Start with neutral tilt
    end
    
//// Letter decoder
//    always @(*) begin
//        case (switch_input)
//            6'b000000: letter_buffer = 6'b000000; // ASCII 97
//            6'b000001: letter_buffer = "b"; // ASCII 98
//            6'b000010: letter_buffer = "c"; // ASCII 99
//            6'b000011: letter_buffer = "d"; // ASCII 100
//            6'b000100: letter_buffer = "e"; // ASCII 101
//            6'b000101: letter_buffer = "f"; // ASCII 102
//            6'b000110: letter_buffer = "g"; // ASCII 103
//            6'b000111: letter_buffer = "h"; // ASCII 104
//            6'b001000: letter_buffer = "i"; // ASCII 105
//            6'b001001: letter_buffer = "j"; // ASCII 106
//            6'b001010: letter_buffer = "k"; // ASCII 107
//            6'b001011: letter_buffer = "l"; // ASCII 108
//            6'b001100: letter_buffer = "m"; // ASCII 109
//            6'b001101: letter_buffer = 6'b001101; // ASCII 110
//            6'b001110: letter_buffer = "o"; // ASCII 111
//            6'b001111: letter_buffer = "p"; // ASCII 112
//            6'b010000: letter_buffer = "q"; // ASCII 113
//            6'b010001: letter_buffer = "r"; // ASCII 114
//            6'b010010: letter_buffer = "s"; // ASCII 115
//            6'b010011: letter_buffer = 6'b010011; // ASCII 116
//            6'b010100: letter_buffer = "u"; // ASCII 117
//            6'b010101: letter_buffer = "v"; // ASCII 118
//            6'b010110: letter_buffer = "w"; // ASCII 119
//            6'b010111: letter_buffer = "x"; // ASCII 120
//            6'b011000: letter_buffer = "y"; // ASCII 121
//            6'b011001: letter_buffer = "z"; // ASCII 122
//            default: letter_buffer = 6'b111111;   // Default to space
//        endcase
//    end

    // Letter decoder
//    always @(*) begin
//        case (switch_input)  // Concatenate tilt_input and switch_input
//            6'b000000: letter_buffer = 6'b000000; // ASCII 97
//            6'b000001: letter_buffer = 6'b000001; // ASCII 98
//            6'b000010: letter_buffer = 6'b000010; // ASCII 99
//            6'b000011: letter_buffer = 6'b000011; // ASCII 100
//            6'b000100: letter_buffer = 6'b000100; // ASCII 101
//            6'b000101: letter_buffer = 6'b000101; // ASCII 102
//            6'b000110: letter_buffer = 6'b000110; // ASCII 103
//            6'b000111: letter_buffer = 6'b000111; // ASCII 104
//            6'b001000: letter_buffer = 6'b001000; // ASCII 105
//            6'b001001: letter_buffer = 6'b001001; // ASCII 106
//            6'b001010: letter_buffer = 6'b001010; // ASCII 107
//            6'b001011: letter_buffer = 6'b001011; // ASCII 108
//            6'b001100: letter_buffer = 6'b001100; // ASCII 109
//            6'b001101: letter_buffer = 6'b001101; // ASCII 110
//            6'b001110: letter_buffer = 6'b001110; // ASCII 111
//            6'b001111: letter_buffer = 6'b001111; // ASCII 112
//            6'b010000: letter_buffer = 6'b010000; // ASCII 113
//            6'b010001: letter_buffer = 6'b010001; // ASCII 114
//            6'b010010: letter_buffer = 6'b010010; // ASCII 115
//            6'b010011: letter_buffer = 6'b010011; // ASCII 116
//            6'b010100: letter_buffer = 6'b010100; // ASCII 117
//            6'b010101: letter_buffer = 6'b010101; // ASCII 118
//            6'b010110: letter_buffer = 6'b010110; // ASCII 119
//            6'b010111: letter_buffer = 6'b010111; // ASCII 120
//            6'b011000: letter_buffer = 6'b011000; // ASCII 121
//            6'b011001: letter_buffer = 6'b011001; // ASCII 122
//            default: letter_buffer = 6'b111111;   // Default to space
//        endcase
//    end 
    

    always @(*) begin
        case (switch_input)
            6'b000000, 6'b000001, 6'b000010, 6'b000011, 
            6'b000100, 6'b000101, 6'b000110, 6'b000111, 
            6'b001000, 6'b001001, 6'b001010, 6'b001011, 
            6'b001100, 6'b001101, 6'b001110, 6'b001111, 
            6'b010000, 6'b010001, 6'b010010, 6'b010011, 
            6'b010100, 6'b010101, 6'b010110, 6'b010111, 
            6'b011000, 6'b011001                            
                    : letter_buffer = switch_input; 
            
            default: letter_buffer = 6'b111111;   // Default to space
        endcase
    end 

    // Sequential Logic for Buffer Management
    always @(posedge clk) begin
        if (rst) begin
            letter1 <= 6'b111111;
            letter2 <= 6'b111111;
            letter3 <= 6'b111111;
            current_position <= 2'b00;
            last_inserted_position <= 2'b00; // Reset the last inserted position
            flagEN <= 0;
            flagDel <= 0;
            prev_tilt_input <= 2'b00; // Start from neutral
        end
        
        // Handle letter insertion (press/release en)
        if (en & ~flagEN) begin
            // Add a new letter to the next available position
            case (current_position)
                2'b00: begin
                    letter1 <= letter_buffer;
                    current_position <= 2'b01; // Move to next available slot
                    last_inserted_position <= 2'b00; // Track letter1 as the last inserted
                end
                2'b01: begin
                    letter2 <= letter_buffer;
                    current_position <= 2'b10; // Move to next available slot
                    last_inserted_position <= 2'b01; // Track letter2 as the last inserted
                end
                2'b10: begin
                    letter3 <= letter_buffer;
                    last_inserted_position <= 2'b10;
                end
            endcase
            flagEN <= 1;
        end else if (~en) flagEN <= 0;
        
        // Handle letter deletion (press/release del)
        if (del & !flagDel) begin
            // Perform delete action based on last_inserted_position
            case (last_inserted_position)
                2'b00: begin
                    letter1 <= 6'b111111; // Clear the first letter
                    current_position <= 2'b00; // Remain at the start (no letters to delete)
                    last_inserted_position <= 2'b00;
                end
                2'b01: begin
                    letter2 <= 6'b111111; // Clear the second letter
                    current_position <= 2'b01; // Move position back to letter1
                    last_inserted_position <= 2'b00;
                end
                2'b10: begin
                    letter3 <= 6'b111111; // Clear the third letter
                    current_position <= 2'b10; // Move position back to letter2
                    last_inserted_position <= 2'b01;
                end
            endcase
            flagDel <= 1; // Set the flag to indicate delete action is in progress
        end else if (!del) flagDel <= 0; // Reset the flag when delete button is released
        
        
        
        
        
        // NEW LOGIC: Simplified tilt handling
        // Instead of flags, we detect when tilt_input changes.
        // If tilt_input changes to 2'b01 (left) from something else, move left if possible.
        // If tilt_input changes to 2'b10 (right) from something else, move right if possible.
        
        // Detect rising edge-like behavior: tilt moves pointer only when tilt_input changes.
        if (tilt_input == 2'b01 && prev_tilt_input != 2'b01) begin
            if (current_position > 2'b00)
                current_position <= current_position - 1;
        end
        else if (tilt_input == 2'b10 && prev_tilt_input != 2'b10) begin
            if (current_position < 2'b10)
                current_position <= current_position + 1;
        end
        
        // Update prev_tilt_input to current tilt_input every cycle
        prev_tilt_input <= tilt_input;
    end
endmodule
