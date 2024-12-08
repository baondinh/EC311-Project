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

module vga_top(clk, reset, en, del, switch_input, vga_r, vga_g, vga_b, h_sync, v_sync, miso, sclk, mosi, cs, acl_data);
//module vga_top(clk, reset, en, del, switch_input, vga_r, vga_g, vga_b, h_sync, v_sync);
//module vga_top(clk, reset, en, del, switch_input, vga_r, vga_g, vga_b, h_sync, v_sync);

    input clk, reset, en, del;
    input [5:0] switch_input;
    reg [1:0] letter_index=2'b00;
    reg [1:0] tilt_y;    
    output reg [3:0] vga_r, vga_g, vga_b;
    output h_sync, v_sync;
    reg [3:0] color1, color2, color3;
    wire newClk, ledOn, char;
    wire [5:0] letter1;
    wire [5:0] letter2;
    wire [5:0] letter3;
    input miso;                 // master in
	output sclk;				// 1MHz
    output reg mosi = 1'b0;     // master out
    output reg cs = 1'b1;       // slave chip select
    output [14:0] acl_data;     // 15 bit data, 5 each axis
    
    // CLK DIVIDER FROM 100MHz -> 25 MHz
    clk_divider clkDiv (clk, reset, newClk);
    
    accelerometer accel(newClk, miso, sclk, mosi, cs, acl_data);
    acl_data_decoder decoder1(newClk, acl_data, tilt_y);
    
    debouncer debEN(clk, en, clean_en);
    debouncer debDEL(clk, del, clean_del);

    letter_decoder ltrD(clk, reset, clean_en, clean_del, switch_input, letter1, letter2, letter3);

    vga_controller vga_con(newClk, letter1, letter2, letter3, h_sync, v_sync, ledOn, char, tilt_y, letter_index);
        
    always@(posedge newClk) begin
        vga_r <= (ledOn) ? (char ? 255: 0) : 0; 
        vga_g <= (ledOn) ? (char ? 255: 0) : 0;
        vga_b <= (ledOn) ? (char ? 0: 255) : 0;
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