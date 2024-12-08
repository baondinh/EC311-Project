`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 07:30:01 PM
// Design Name: 
// Module Name: tilter_tb
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


module tilter_tb;

    reg clk;                    
    reg reset;                  
    reg en;                     
    reg del;                    
    reg [1:0] tilt_input;       
    reg [2:0] switch_input;     
    wire [7:0] letter1;         
    wire [7:0] letter2;         
    wire [7:0] letter3;         

    // Instantiate the tilt module
    tilter uut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .del(del),
        .tilt_input(tilt_input),
        .switch_input(switch_input),
        .letter1(letter1),
        .letter2(letter2),
        .letter3(letter3)
    );

    // Clock generation (50 MHz clock -> 20 ns period)
    always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        en = 0;
        del = 0;
        tilt_input = 0;
        switch_input = 0;

        // Apply reset
        #20 reset = 0;
        $display("Time=%0t, Reset applied. letter1=%c, letter2=%c, letter3=%c", $time, letter1, letter2, letter3);

        // Test Case 1: Add letter "A" (tilt_input = 2'b00, switch_input = 3'b000)
        #20 en = 1;
        tilt_input = 2'b00;
        switch_input = 3'b000;  // Input combination for "A"
        #20 en = 0;             // Disable after adding
        $display("Time=%0t, Added A. letter1=%c, letter2=%c, letter3=%c", $time, letter1, letter2, letter3);

        // Test Case 2: Add letter "N" (tilt_input = 2'b01, switch_input = 3'b101)
        #40 en = 1;
        tilt_input = 2'b01;
        switch_input = 3'b101;  // Input combination for "N" (5'b01101)
        #20 en = 0;             // Disable after adding
        $display("Time=%0t, Added N. letter1=%c, letter2=%c, letter3=%c", $time, letter1, letter2, letter3);

        // Test Case 3: Add letter "Z" (tilt_input = 2'b11, switch_input = 3'b001)
        #40 en = 1;
        tilt_input = 2'b11;
        switch_input = 3'b001;  // Input combination for "Z" (5'b11001)
        #20 en = 0;
        $display("Time=%0t, Added Z. letter1=%c, letter2=%c, letter3=%c", $time, letter1, letter2, letter3);

        // Test Case 4: Delete the last letter (should remove "Z")
        #40 del = 1;
        #20 del = 0;
        $display("Time=%0t, Deleted last letter. letter1=%c, letter2=%c, letter3=%c", $time, letter1, letter2, letter3);

        // Test Case 5: Add letter "G" (tilt_input = 2'b00, switch_input = 3'b110)
        #40 en = 1;
        tilt_input = 2'b00;
        switch_input = 3'b110;  // Input combination for "G" (5'b00110)
        #20 en = 0;
        $display("Time=%0t, Added G. letter1=%c, letter2=%c, letter3=%c", $time, letter1, letter2, letter3);

        // Test Case 6: Reset (clears everything)
        #40 reset = 1;
        #20 reset = 0;
        $display("Time=%0t, Reset applied. letter1=%c, letter2=%c, letter3=%c", $time, letter1, letter2, letter3);

        // End simulation
        #50 $finish;
    end

endmodule


