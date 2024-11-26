`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 01:56:49 PM
// Design Name: 
// Module Name: letter_decoder_tb
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


module letter_decoder_tb;
    reg [1:0] tilt_input;    // 2-bit tilt
    reg [3:0] switch_input;  // 4-bit switch
    wire [7:0] letter;       // ASCII code 
    letter_decoder uut (
        .tilt_input(tilt_input),
        .switch_input(switch_input),
        .letter(letter)
    );

    initial begin
        $monitor("Time=%0t | tilt_input=%b | switch_input=%b | letter=%s", 
                  $time, tilt_input, switch_input, letter);
        tilt_input = 2'b00; switch_input = 4'b0000; #10; // Expect 'a'
        tilt_input = 2'b00; switch_input = 4'b0001; #10; // Expect 'b'
        tilt_input = 2'b00; switch_input = 4'b0010; #10; // Expect 'c'
        tilt_input = 2'b00; switch_input = 4'b0011; #10; // Expect 'd'
        tilt_input = 2'b00; switch_input = 4'b0100; #10; // Expect 'e'
        tilt_input = 2'b00; switch_input = 4'b0101; #10; // Expect 'f'
        tilt_input = 2'b00; switch_input = 4'b0110; #10; // Expect 'g'
        tilt_input = 2'b00; switch_input = 4'b0111; #10; // Expect 'h'
        tilt_input = 2'b00; switch_input = 4'b1000; #10; // Expect 'i'
        tilt_input = 2'b00; switch_input = 4'b1001; #10; // Expect 'j'
        tilt_input = 2'b01; switch_input = 4'b0000; #10; // Expect 'k'
        tilt_input = 2'b01; switch_input = 4'b0001; #10; // Expect 'l'
        tilt_input = 2'b01; switch_input = 4'b0010; #10; // Expect 'm'
        tilt_input = 2'b01; switch_input = 4'b0011; #10; // Expect 'n'
        tilt_input = 2'b01; switch_input = 4'b0100; #10; // Expect 'o'
        tilt_input = 2'b01; switch_input = 4'b0101; #10; // Expect 'p'
        tilt_input = 2'b01; switch_input = 4'b0110; #10; // Expect 'q'
        tilt_input = 2'b01; switch_input = 4'b0111; #10; // Expect 'r'
        tilt_input = 2'b01; switch_input = 4'b1000; #10; // Expect 's'
        tilt_input = 2'b01; switch_input = 4'b1001; #10; // Expect 't'
        tilt_input = 2'b10; switch_input = 4'b0000; #10; // Expect 'u'
        tilt_input = 2'b10; switch_input = 4'b0001; #10; // Expect 'v'
        tilt_input = 2'b10; switch_input = 4'b0010; #10; // Expect 'w'
        tilt_input = 2'b10; switch_input = 4'b0011; #10; // Expect 'x'
        tilt_input = 2'b10; switch_input = 4'b0100; #10; // Expect 'y'
        tilt_input = 2'b10; switch_input = 4'b0101; #10; // Expect 'z'
        tilt_input = 2'b11; switch_input = 4'b0000; #10; // Expect ' ' space

        $finish; 
    end
endmodule
