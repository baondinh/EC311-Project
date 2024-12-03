`timescale 1ns / 1ps



module clkDiv_tb();
    
    reg clk, reset;
    wire newClk;
    
    clk_divider test(clk, reset, newClk);
    
    initial begin
        clk =  0;
        reset = 0;
        #500 $finish;
    end
    
    always #2 clk = ~clk;
endmodule
