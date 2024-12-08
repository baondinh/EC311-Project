`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 05:47:55 PM
// Design Name: 
// Module Name: tilt_tb
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


module tilt_tb();

    reg clk;
    reg reset;
    reg signed [11:0] x, y, z;
    wire [7:0] ascii_out;
    wire valid;

    // Instantiate the module
    tilt_13 uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .z(z),
        .ascii_out(ascii_out),
        .valid(valid)
    );

    // Clock generation
    always #5 clk = ~clk; // Clock toggles every 5ns (100 MHz)

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        x = 0; y = 0; z = 0;

        // Release reset
        #10 reset = 0;
        $display("Simulation started. Time=%0t", $time);

        // Test case 1: Tilt on X-axis for 'A'
        #20 x = 555; 
        #20 $display("Test Case 1: Time=%0t, X=%d, ASCII=%d ('%c'), Valid=%b", 
                     $time, x, ascii_out, ascii_out, valid);
        //x = 0;

        // Test case 2: Tilt on X-axis for 'B'
        #20 x = 605; 
        #20 $display("Test Case 2: Time=%0t, X=%d, ASCII=%d ('%c'), Valid=%b", 
                     $time, x, ascii_out, ascii_out, valid);
        //x = 0;

        // Test case 3: Tilt on Y-axis for 'C'
        #20 y = 555; 
        #20 $display("Test Case 3: Time=%0t, Y=%d, ASCII=%d ('%c'), Valid=%b", 
                     $time, y, ascii_out, ascii_out, valid);
        //y = 0;

        // Test case 4: Tilt on Z-axis for 'D'
        #20 z = 555; 
        #20 $display("Test Case 4: Time=%0t, Z=%d, ASCII=%d ('%c'), Valid=%b", 
                     $time, z, ascii_out, ascii_out, valid);
        //z = 0;

        #50 $finish;
    end


endmodule

