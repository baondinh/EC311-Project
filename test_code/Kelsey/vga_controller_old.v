`timescale 1ns / 1ps

module vga_controller(clk, h_sync, v_sync, led_on);
    
    input clk;
    output reg h_sync, v_sync, led_on;
    
    localparam TOTAL_WIDTH = 800;
    localparam TOTAL_HEIGHT = 525;
    localparam ACTIVE_WIDTH = 640;
    localparam ACTIVE_HEIGHT = 480;
    localparam H_SYNC_COLUMN = 704;
    localparam V_SYNC_LINE = 523;
    
    reg [11:0] widthPos = 0;
    reg [11:0] heightPos = 0;
    
    wire enable = ((widthPos >=50 & widthPos < 690) & (heightPos >=33 & heightPos < 513)) ? 1'b1: 1'b0;
    
    wire bmapenable = ((widthPos >= 50 & widthPos <= 129) & ( heightPos >= 33 & heightPos <= 60)) ? 1'b1: 1'b0;

    reg [0:79] bmap [0:27];
    
    initial begin
    bmap[0]   = 80'b00000000000000000000000000000000000000000000000000000000000000000000000000000000;
    bmap[1]   = 80'b00000000000000000000000000000000000000000000000000000000000000000000000000000000;
    bmap[2]   = 80'b00000000000000000000000000000000000000000000000000000000000000000000000000000000;
    bmap[3]   = 80'b00000000000000000000111111111111111111111111111111111111111100000000000000000000;
    bmap[4]   = 80'b00000000000000000000111111111111111111111111111111111111111100000000000000000000;
    bmap[5]   = 80'b00000000000000000000111111111111111111111111111111111111111100000000000000000000;
    bmap[6]   = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[7]   = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[8]   = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[9]   = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[10]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[11]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[12]  = 80'b00000000001111111111111111111111111111111111111111111111111111111111110000000000;
    bmap[13]  = 80'b00000000001111111111111111111111111111111111111111111111111111111111110000000000;
    bmap[14]  = 80'b00000000001111111111111111111111111111111111111111111111111111111111110000000000;
    bmap[15]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[16]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[17]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[18]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[19]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[20]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[21]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[22]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[23]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[24]  = 80'b00000000001111111111111111111100000000000000000000111111111111111111110000000000;
    bmap[25]  = 80'b00000000000000000000000000000000000000000000000000000000000000000000000000000000;
    bmap[26]  = 80'b00000000000000000000000000000000000000000000000000000000000000000000000000000000;
    bmap[27]  = 80'b00000000000000000000000000000000000000000000000000000000000000000000000000000000;
    end
    
    // Following always block ensures that 
    // you go through all pixel coordinates
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
    
    // this is you main logic based on 
    // your project
    always@(posedge clk)
    begin
        if(enable) // in bounds 
        begin
            if (bmapenable) // if can traverse over bmp
            begin
                if (bmap[widthPos - 50][heightPos - 33])
                begin
                    led_on <= 1'b1;
                end
            end
        end
        else
        begin
            led_on <= 1'b0;
        end 
   end   
        
endmodule