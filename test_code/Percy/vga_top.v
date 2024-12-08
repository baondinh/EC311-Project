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


`timescale 1ns / 1ps

module vga_top(clk, reset, in_r, in_g, in_b, vga_r, vga_g, vga_b, h_sync, v_sync, tilt_y);

    input clk, reset;
    input [3:0] in_r, in_g, in_b;
    input [1:0] tilt_y; 
    reg [1:0] letter_index=2'b00;
    output reg [3:0] vga_r, vga_g, vga_b;
    reg [3:0] color1, color2, color3;
    output h_sync, v_sync;
    wire newClk, ledOn, letter_selected;
    
    clk_divider clkDiv (clk, reset, newClk);
    
    vga_controller_ONE vga_conOne(newClk, 8'b01010001,8'b01001001, 8'b01010001,letter_index, h_sync, v_sync, ledOn, tilt_y);
        
    always@(posedge newClk)
    begin
      if(ledOn) begin
            vga_r <= in_r;
            vga_g <= in_g;
            vga_b <= in_b;
      end
      else begin
            vga_r <= 4'b0;  
            vga_g <= 4'b0;
            vga_b <= 4'b0;
      end
      
    end
always@(posedge newClk)
    begin
case (letter_index)
            2'b00: begin
                color1 <= vga_r; // Highlight
                color2 <= vga_g; 
                color3 <= vga_g; 
            end
            2'b01: begin
                color1 <= vga_g; 
                color2 <= vga_r; // Highlight
                color3 <= vga_g; 
            end
            2'b10: begin
                color1 <= vga_g; 
                color2 <= vga_g; 
                color3 <= vga_r; // Highlight
            end
        endcase
    end   
    
    
endmodule
