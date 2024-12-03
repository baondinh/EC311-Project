`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 10:24:19 AM
// Design Name: 
// Module Name: helloworld_top
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


module helloworld_top(clk, reset, in_r, in_g, in_b, vga_r, vga_g, vga_b, h_sync, v_sync);
    input clk, reset;
    input [3:0] in_r, in_g, in_b;
    
    output reg [3:0] vga_r, vga_g, vga_b;
    output h_sync, v_sync;
    wire newClk, ledOn, char;
    
    
    clk_divider clkDiv (clk, reset, newClk);
    
    helloworld vga_con (newClk, h_sync, v_sync, ledOn, char);
    
    always@(posedge newClk) begin
        vga_r <= (ledOn) ? (char ? in_r: 255) : 0; 
        vga_g <= (ledOn) ? (char ? in_g: 255) : 0;
        vga_b <= (ledOn) ? (char ? in_b: 0) : 0;
    end
endmodule
