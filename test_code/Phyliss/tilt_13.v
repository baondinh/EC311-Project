`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 05:30:29 PM
// Design Name: 
// Module Name: tilt_13
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



module tilt_13 (
    input wire clk,                   
    input wire reset,                 
    input wire signed [11:0] x,       // X-axis tilt 
    input wire signed [11:0] y,       // Y-axis tilt 
    input wire signed [11:0] z,       // Z-axis tilt 
    output reg [7:0] ascii_out,       // ASCII code output
    output reg valid                  // Output validity signal
);


    // Tilt thresholds for letter identification
    parameter signed X_THRES = 12'd500;  
    parameter signed Y_THRES = 12'd500;  
    parameter signed Z_THRES = 12'd500;
    parameter signed THRES_STEP = 12'd50;  // Incremental threshold step for letters


    // State encoding
    parameter IDLE          = 3'b000; 
    parameter PROCESS_X     = 3'b001; 
    parameter PROCESS_Y     = 3'b010; 
    parameter PROCESS_Z     = 3'b011; 
    parameter OUTPUT_LETTER = 3'b100;

    reg [2:0] state, next_state;      // Current and next state
    reg [7:0] letter_map [0:12];      // Array to store ASCII codes for 13 letters
    reg match_found;                  // Flag to stop further processing
    integer i;                        // Loop index variable


    // Initialize letter map (ASCII codes for 'A' to 'M')
    initial begin
        letter_map[0]  = 8'd65;  // 'A'
        letter_map[1]  = 8'd66;  // 'B'
        letter_map[2]  = 8'd67;  // 'C'
        letter_map[3]  = 8'd68;  // 'D'
        letter_map[4]  = 8'd69;  // 'E'
        letter_map[5]  = 8'd70;  // 'F'
        letter_map[6]  = 8'd71;  // 'G'
        letter_map[7]  = 8'd72;  // 'H'
        letter_map[8]  = 8'd73;  // 'I'
        letter_map[9]  = 8'd74;  // 'J'
        letter_map[10] = 8'd75;  // 'K'
        letter_map[11] = 8'd76;  // 'L'
        letter_map[12] = 8'd77;  // 'M'
    end


    // Sequential state machine
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            ascii_out <= 8'd0;  // Initialize to 0
            valid <= 1'b0;      // Initialize valid signal to 0
        end else begin
            state <= next_state;
        end
    end


    // Combinational state transitions and outputs
    always @(*) begin
        valid = 1'b0;            // Default valid signal
        next_state = state;      // Default next state
        match_found = 1'b0;      // Reset match_found flag for each state

        case (state)
        
            // Idle state waits for a tilt above a base threshold
            IDLE: begin
                if (x >= X_THRES) begin
                    next_state = PROCESS_X;
                end else if (y >= Y_THRES) begin
                    next_state = PROCESS_Y;
                end else if (z >= Z_THRES) begin
                    next_state = PROCESS_Z;
                end
            end


            // Process tilt in the X-axis
            PROCESS_X: begin
                for (i = 0; i < 13; i = i + 1) begin
                
                    if (!match_found && x >= (X_THRES + i * THRES_STEP)) begin
                        ascii_out = letter_map[i];  // Assign the corresponding letter
                        
                        $display("PROCESS_X: Time=%0t, X=%d, Match=%d, ASCII=%d ('%c')", 
                                 $time, x, i, ascii_out, ascii_out);
                        match_found = 1'b1;         // Stop further matches
                    end
                end
                next_state = OUTPUT_LETTER;         // Transition to output state
            end


            // Process tilt in the Y-axis
            PROCESS_Y: begin
                for (i = 0; i < 13; i = i + 1) begin
                    if (!match_found && y >= (Y_THRES + i * THRES_STEP)) begin
                        ascii_out = letter_map[i];
                        $display("PROCESS_Y: Time=%0t, Y=%d, Match=%d, ASCII=%d ('%c')", 
                                 $time, y, i, ascii_out, ascii_out);
                        match_found = 1'b1;
                    end
                end
                next_state = OUTPUT_LETTER;
            end

            // Process tilt in the Z-axis
            PROCESS_Z: begin
                for (i = 0; i < 13; i = i + 1) begin
                    if (!match_found && z >= (Z_THRES + i * THRES_STEP)) begin
                        ascii_out = letter_map[i];
                        $display("PROCESS_Z: Time=%0t, Z=%d, Match=%d, ASCII=%d ('%c')", 
                                 $time, z, i, ascii_out, ascii_out);
                        match_found = 1'b1;
                    end
                end
                next_state = OUTPUT_LETTER;
            end


            // Output the valid ASCII code
            OUTPUT_LETTER: begin
                valid = 1'b1;           // Indicate the output is valid
                next_state = IDLE;      // Return to IDLE for the next input
            end

            // Default case ensures robustness
            default: begin
                next_state = IDLE;  // Fallback to IDLE state
            end
        endcase
    end


endmodule
