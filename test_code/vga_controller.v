`timescale 1ns / 1ps

module vga_controller(clk, letter_sel, h_sync, v_sync, led_on);
    
    input clk;
    input wire [0:7] letter_sel;
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
    
    wire bmapenable = ((widthPos >= 50 & widthPos <= 57) & ( heightPos >= 50 & heightPos <= 65)) ? 1'b1: 1'b0;

    reg [0:7] bmap [0:15];
    
        initial
        begin
        bmap[0]   = 8'b00000000;
        bmap[1]   = 8'b00000000;
        bmap[2]   = 8'b00010000;
        bmap[3]   = 8'b00111000;
        bmap[4]   = 8'b01101100;
        bmap[5]   = 8'b11000110;
        bmap[6]   = 8'b11000110;
        bmap[7]   = 8'b11111110;
        bmap[8]   = 8'b11111110;
        bmap[9]   = 8'b11000110;
        bmap[10]  = 8'b11000110;
        bmap[11]  = 8'b11000110;
        bmap[12]  = 8'b00000000;
        bmap[13]  = 8'b00000000;
        bmap[14]  = 8'b00000000;
        bmap[15]  = 8'b00000000;
        end
        
        always @(posedge clk)
        
        case (letter_sel)
        8'b01010001:
        begin
        	bmap[0] = 8'b00000000;	//
			bmap[1] = 8'b00000000;	//
			bmap[2] = 8'b11111100;	// *****
			bmap[3] = 8'b11111110;	//*******
			bmap[4] = 8'b11000110;	//**   **
			bmap[5] = 8'b11000110;	//**   **
			bmap[6] = 8'b11000110;	//**   **
			bmap[7] = 8'b11000110;	//**   **  
			bmap[8]  = 8'b11010110;	//** * **
			bmap[9] = 8'b11111110;	//*******
			bmap[10] = 8'b01101100;	// ** ** 
			bmap[11] = 8'b00000110;	//     **
			bmap[12] = 8'b00000000;	//
			bmap[13] = 8'b00000000;	//
			bmap[14] = 8'b00000000;	//
			bmap[15] = 8'b00000000;	//
        end
        
        8'b01001001:
        begin
            bmap[0] = 8'b00000000;	//
			bmap[1] = 8'b00000000;	//
			bmap[2] = 8'b11111110;	//*******
			bmap[3] = 8'b11111110;	//*******
			bmap[4] = 8'b00110000;	//  **
			bmap[5] = 8'b00110000;	//  **
			bmap[6] = 8'b00110000;	//  **
			bmap[7] = 8'b00110000;	//  **
			bmap[8] = 8'b00110000;	//  **
			bmap[9] = 8'b00110000;	//  **
			bmap[10] = 8'b11111110;	//*******
			bmap[11] = 8'b11111110;	//*******
			bmap[12] = 8'b00000000;	//
			bmap[13] = 8'b00000000;	//
			bmap[14] = 8'b00000000;	//
			bmap[15] = 8'b00000000;	//
        end
        endcase
   
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
    //always@(posedge clk)
    //begin
    //    if(enable) // in bounds 
    //    begin
    //        if (bmapenable) // if can traverse over bmp
    //        begin
    //            if (bmap[widthPos - 50][heightPos - 33])
    //            begin
    //                led_on <= 1'b1;
    //            end
    //        end
    //    end
    //    else
    //    begin
    //        led_on <= 1'b0;
    //    end 
   //end  
   
    always@(posedge clk)
    begin
        if(enable & bmapOneenable)
            begin   
            led_on <= bmap[heightPos-50][widthPos-50];
            end
        
        else
            begin
            led_on <= 1'b0;
            end
     end
    
        
endmodule
