
`timescale 1ns / 1ps
// i put my design source to Chatgpt to get this test branch. 
//input of d a o b c g, and pull EN low when it is a, then del b and c, so it output dog in the end
module letter_decoder_tb;
 reg clk, rst, en, del;                  // Clock, Reset, Enable, Delete signals
    //reg [1:0] tilt_input;                  // 2-bit tilt input
    reg [5:0] switch_input;                // 4-bit switch input
    wire [7:0] letter1, letter2, letter3;  // Outputs for 3-letter storage

    // Instantiate the module
    letter_decoder uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .del(del),
        //.tilt_input(tilt_input),
        .switch_input(switch_input),
        .letter1(letter1),
        .letter2(letter2),
        .letter3(letter3)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test logic
    initial begin
        // Initial state
        rst = 1; en = 0; del = 0;  switch_input = 6'b000000;
        #10 rst = 0; // Release reset

        // Input: 'd' (tilt_input=00, switch_input=0011)
        en = 1;  switch_input = 6'b000011; #10;

        // Input: 'a' (tilt_input=00, switch_input=0000), pull EN low
        en = 0;  switch_input = 6'b000000; #10;

        // Input: 'o' (tilt_input=00, switch_input=1111), EN back high
        en = 1;  switch_input = 6'b001110; #10;

        // Input: 'b' (tilt_input=00, switch_input=0001)
        en = 1;  switch_input = 6'b000001; #10;


        // Input: 'c' (tilt_input=00, switch_input=0010)
        en = 1;  switch_input = 6'b000010; #10;
        en = 0; # 10;
        // Delete 'b' and 'c' using DEL
        del = 1; #10;
        del = 0; #10;

        //Input: 'g' (tilt_input=00, switch_input=0110)
       // en = 1; tilt_input = 2'b00; switch_input = 4'b1110; #10;
        en = 1; switch_input = 6'b000110; #10;      
        //en = 1; tilt_input = 2'b00; switch_input = 4'b0110; #10;   

        // Stop simulation
         $stop;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0d | EN: %b | DEL: %b | Input: %b | Letter1: %c | Letter2: %c | Letter3: %c", 
                 $time, en, del, switch_input, letter1, letter2, letter3);
    end

endmodule
