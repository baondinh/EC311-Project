`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 02:24:59 PM
// Design Name: 
// Module Name: helloworld_scaled
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


module helloworld_scaled(clk, h_sync, v_sync, ledOn, char);
    
    input clk;
    output reg h_sync, v_sync, ledOn, char; 
    
    
    localparam TOTAL_WIDTH = 800;
    localparam TOTAL_HEIGHT = 525;
    localparam ACTIVE_WIDTH = 640;
    localparam ACTIVE_HEIGHT = 480;
    localparam H_SYNC_COLUMN = 704;
    localparam V_SYNC_LINE = 523;
    
    reg [11:0] widthPos = 0;
    reg [11:0] heightPos = 0;
    
    
    wire enable = ((widthPos >=50 & widthPos < 690) & (heightPos >=33 & heightPos < 513)) ? 1'b1: 1'b0;
    // enable based on input character versus pixel region? 
//  Square box in middle using enable    
//    wire box_region = ((widthPos > 220 && widthPos < 241) && (heightPos > 140 && heightPos < 156)) ? 1'b1: 1'b0;
//    wire box_region = ((widthPos > 390 && widthPos < 500) && (heightPos > 140 && heightPos < 156)) ? 1'b1: 1'b0;
    
    reg [0:19] bmap [0:14]; // 15 lines (elements), 20 bits each
    // Hello World bitmap
    initial begin
        bmap[0]  = 20'b1010_1110_1000_1000_0110;
        bmap[1]  = 20'b1010_1000_1000_1000_1010;
        bmap[2]  = 20'b1110_1100_1000_1000_1010;
        bmap[3]  = 20'b1010_1000_1000_1000_1010;
        bmap[4]  = 20'b1010_1110_1110_1110_1100;
        bmap[5]  = 20'b0000_0000_0000_0000_0000;
        bmap[6]  = 20'b1010_0110_1110_1000_1100;
        bmap[7]  = 20'b1010_1010_1010_1000_1010;
        bmap[8]  = 20'b1010_1010_1100_1000_1010;
        bmap[9]  = 20'b1110_1010_1010_1000_1010;
        bmap[10] = 20'b1110_1100_1010_1110_1110;
        bmap[11] = 20'b0000_0000_0000_0000_0000;
        bmap[12] = 20'b0000_0000_0000_0000_0000;
        bmap[13] = 20'b0000_0000_0000_0000_0000;
        bmap[14] = 20'b0000_0000_0000_0000_0000;
    end
    
    reg [4:0] x;
    reg [3:0] y;
    always @* begin
        if (enable) begin
//            x <= widthPos; 
//            y <= heightPos; 

//            x <= widthPos - 50;
//            y <= heightPos - 33;

            x <= ((widthPos - 50) / 32);
            y <= ((heightPos - 33) / 32);
            
//            x <= ((widthPos - 40) / 32);
//            y <= ((heightPos - 23) / 32);
        end else begin
            x <= 0; 
            y <= 0; 
        end
    end
        
    // Following always block ensures that you go through all pixel coordinates
    always@(posedge clk)
    begin
        // check if end of the width 
        if(widthPos < TOTAL_WIDTH -1)
        begin 
            widthPos <= widthPos + 1;
        end
        else
        begin
            // move back to the first column
            widthPos <=0;
            // check if end of the height
            if(heightPos < TOTAL_HEIGHT -1)
            begin
                heightPos <= heightPos + 1;
            end
            else
            begin
                 heightPos <= 0;
            end       
        end
    end
    
    always@(posedge clk)
    begin
        if (widthPos < H_SYNC_COLUMN)
        begin
            h_sync <= 1'b1;
        end
        else
        begin
            h_sync <= 1'b0;
        end
   end


    always@(posedge clk)
    begin
        if (heightPos < V_SYNC_LINE)
        begin
            v_sync <= 1'b1;
        end
        else
        begin
            v_sync <= 1'b0;
        end
   end
    
   always@(posedge clk)
    begin
        if(enable) begin
            ledOn <= 1'b1;
            char <= bmap[y][x];
        end 
        else begin
            ledOn <= 1'b0;
            char <= 1'b0;
        end
   end      
endmodule
