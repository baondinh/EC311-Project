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


module vga_top(clk, reset, en, del, switch_input, vga_r, vga_g, vga_b, h_sync, v_sync);
//module vga_top(clk, reset, en, del, switch_input, vga_r, vga_g, vga_b, h_sync, v_sync);

    input clk, reset, en, del;
    input [5:0] switch_input;
    
    output reg [3:0] vga_r, vga_g, vga_b;
    output h_sync, v_sync;
    
    wire newClk, ledOn, char;
    wire [5:0] letter1;
    wire [5:0] letter2;
    wire [5:0] letter3;

    // CLK DIVIDER FROM 100MHz -> 25 MHz
    clk_divider clkDiv (clk, reset, newClk);
    
    letter_decoder ltrD(clk, rst, en, del, switch_input, letter1, letter2, letter3);
    
    vga_controller vga_con(newClk, letter1, letter2, letter3, h_sync, v_sync, ledOn, char);
        
    always@(posedge newClk) begin
        vga_r <= (ledOn) ? (char ? 255: 0) : 0; 
        vga_g <= (ledOn) ? (char ? 255: 0) : 0;
        vga_b <= (ledOn) ? (char ? 0: 255) : 0;
    end    
endmodule