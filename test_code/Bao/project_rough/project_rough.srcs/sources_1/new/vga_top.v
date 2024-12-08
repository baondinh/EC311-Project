`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 05:21:28 PM
// Design Name: 
// Module Name: vga_top
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


//module vga_top(clk, rst, en, del, switch_input, vga_r, vga_g, vga_b, h_sync, v_sync);
module vga_top(clk, reset, in_r, in_g, in_b, vga_r, vga_g, vga_b, h_sync, v_sync);

    input clk, reset;
    input [3:0] in_r, in_g, in_b;
    
    output reg [3:0] vga_r, vga_g, vga_b;
    output h_sync, v_sync;
    wire newClk, ledOn, char;
    
    // CLK DIVIDER FROM 100MHz -> 25 MHz
    clk_divider clkDiv (clk, reset, newClk);
//    input clk, rst, en, del;
//    input [5:0] switch_input;
    
//    output reg [3:0] vga_r, vga_g, vga_b;
//    output h_sync, v_sync;
//    wire newClk, ledOn;
    
//    clk_divider clkDiv (clk, rst, newClk);
    
//    letter_decoder ltrd(clk, rst, en, del, switch_input, letter1, letter2, letter3);
    
//    vga_controller vga_conOne(newClk, letter1, letter2, letter3, h_sync, v_sync, ledOn);
    vga_controller vga_conOne(newClk, 6'b010000, 6'b010000, 6'b000000, h_sync, v_sync, ledOn, char);
        
    always@(posedge newClk) begin
        vga_r <= (ledOn) ? (char ? 255: 255) : 0; 
        vga_g <= (ledOn) ? (char ? 0: 255) : 0;
        vga_b <= (ledOn) ? (char ? 255: 0) : 255;
    end    
//    always@(posedge newClk)
//    begin
//      if(ledOn) begin
//            vga_r <= in_r;
//            vga_g <= in_g;
//            vga_b <= in_b;
//      end
//      else begin
//            vga_r <= 4'b0;
//            vga_g <= 4'b0;
//            vga_b <= 4'b0;
//      end
//    end  
endmodule
