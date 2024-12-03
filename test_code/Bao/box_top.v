`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2024 03:38:26 PM
// Design Name: 
// Module Name: box_top
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


module box_top(clk, reset, in_r, in_g, in_b, vga_r, vga_g, vga_b, h_sync, v_sync);

    input clk, reset;
    input [3:0] in_r, in_g, in_b;
    
    output reg [3:0] vga_r, vga_g, vga_b;
    output h_sync, v_sync;
    wire newClk, ledOn;
    
    clk_divider clkDiv (clk, reset, newClk);
    
    box vga_con (newClk, h_sync, v_sync, ledOn);
    
    always@(posedge newClk) begin
        vga_r = (ledOn) ? in_r : 0; 
        vga_g = (ledOn) ? in_g : 0;
        vga_b = (ledOn) ? in_b : 0;
    end
//      if(ledOn) begin
//            vga_r <= in_r;
//            vga_g <= in_g;
//            vga_b <= in_b;
            
//            paint_r = (square) ? 4'hF : 4'h1;
//            paint_g = (square) ? 4'hF : 4'h3;
//            paint_b = (square) ? 4'hF : 4'h7;
//      end
//      else begin
//            vga_r <= 0;  
//            vga_g <= 4'b0;
//            vga_b <= 4'b0;
//      end
//    end
endmodule
