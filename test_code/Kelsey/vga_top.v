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

module vga_top(clk, reset, in_r, in_g, in_b, vga_r, vga_g, vga_b, h_sync, v_sync);

    input clk, reset;
    input [3:0] in_r, in_g, in_b;
    
    output reg [3:0] vga_r, vga_g, vga_b;
    output h_sync, v_sync;
    wire newClk, ledOn;
    
    clk_divider clkDiv (clk, reset, newClk);
    
    vga_controller_ONE vga_conOne(newClk, 8'b01010001,8'b01001001, 8'b01010001, h_sync, v_sync, ledOn);
        
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
    
endmodule
