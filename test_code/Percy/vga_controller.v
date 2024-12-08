`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 05:22:10 PM
// Design Name: 
// Module Name: vga_controller
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

module vga_controller_ONE(clk, letter_sel_ONE, letter_sel_TWO, letter_sel_THREE,letter_index , h_sync, v_sync, led_on,tilt_y);
    
    input clk;
    input wire [0:7] letter_sel_ONE;
    input wire [0:7] letter_sel_TWO;
    input wire [0:7] letter_sel_THREE;
    input wire [2:0] tilt_y;
    output reg [1:0] letter_index= 2'b00;
    
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
    
    wire bmapenableONE = ((widthPos >= 20 & widthPos <= 219) & ( heightPos >= 160 & heightPos <= 320)) ? 1'b1: 1'b0;
    wire bmapenableTWO = ((widthPos >= 220 & widthPos <= 419) & ( heightPos >= 160 & heightPos <= 320)) ? 1'b1: 1'b0;
    wire bmapenableTHREE = ((widthPos >= 420 & widthPos <= 619) & ( heightPos >= 160 & heightPos <= 320)) ? 1'b1: 1'b0;
    
    // Help from Fadi on this code. Displaying two characters at once without two separate vga_controllers
    wire [0:7] curr_letter_sel;
    assign curr_letter_sel = bmapenableONE ? letter_sel_ONE : (bmapenableTWO ? letter_sel_TWO : letter_sel_THREE);

    reg [2:0] x;
    reg [3:0] y; 
    

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
        case (curr_letter_sel)
        8'b01010001:
        begin
        	bmap[0] =  8'b00000000;	//
			bmap[1] =  8'b00000000;	//
			bmap[2] =  8'b11111100;	// *****
			bmap[3] =  8'b11111110;	//*******
			bmap[4] =  8'b11000110;	//**   **
			bmap[5] =  8'b11000110;	//**   **
			bmap[6] =  8'b11000110;	//**   **
			bmap[7] =  8'b11000110;	//**   **  
			bmap[8]  = 8'b11010110;	//** * **
			bmap[9] =  8'b11111110;	//*******
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
    
//    wire bmapenableONE = ((widthPos >= 20 & widthPos <= 219) & ( heightPos >= 160 & heightPos <= 320)) ? 1'b1: 1'b0;
//    wire bmapenableTWO = ((widthPos >= 220 & widthPos <= 419) & ( heightPos >= 160 & heightPos <= 320)) ? 1'b1: 1'b0;
//    wire bmapenableTHREE = ((widthPos >= 420 & widthPos <= 619) & ( heightPos >= 160 & heightPos <= 320)) ? 1'b1: 1'b0;
    
    always @(*) begin
        if (bmapenableONE) begin
            x <= (widthPos - 20)/25;
            y <= (heightPos - 160)/10;
        end
        else 
            begin
        x <= 0;
        y <= 0;
        end
    end
    
    // this is you main logic based on 
    // your project
   
    always@(posedge clk)
    begin
        if(enable & bmapenableONE)
            begin   
            led_on <= bmap[y][x];
            end
        else if (enable & bmapenableTWO)
            begin   
            led_on <= bmap[y][x];
            end
        else
            begin
            led_on <= 1'b0;
            end
     end
     
    always @(posedge clk) begin
    if (clk) begin
        letter_index <= 2'b00; // Start at the first letter
    end else begin
        case (tilt_y)
            2'b11: begin
                // Tilt forward
                if (letter_index < 2'b10) begin
                    letter_index <= letter_index + 1;
                end
            end
            2'b00: begin
                // Tilt backward
                if (letter_index > 2'b00) begin
                    letter_index <= letter_index - 1;
                end
            end
            default: begin
                letter_index <= letter_index;
            end
        endcase
    end
end
        
endmodule
