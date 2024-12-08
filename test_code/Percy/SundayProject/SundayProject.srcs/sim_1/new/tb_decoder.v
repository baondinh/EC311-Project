`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 06:10:29 PM
// Design Name: 
// Module Name: tb_decoder
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


module tb_decoder;
    reg [14:0] acl_data;
    wire [1:0] tilt_y;

    acl_data_decoder uut (
        .acl_data(acl_data),
        .tilt_y(tilt_y)
    );

    initial begin
        $monitor("Time: %t | ACL Data: %b | Tilt_Y: %b", $time, acl_data, tilt_y);

        // Test cases
        acl_data = 15'b0000_01000_01000; #10;  // Y[9:5] = 01000 -> tilt_y = 01 (Expected)
        acl_data = 15'b0000_10000_01000; #10;  // Y[9:5] = 10000 -> tilt_y = 10 (Expected, Y[9] = 1 and Y[3:0] >= 8)
        acl_data = 15'b0000_10100_01000; #10;  // Y[9:5] = 10100 -> tilt_y = 10 (Expected, Y[9] = 1 and Y[3:0] >= 8)
        acl_data = 15'b0000_01100_01000; #10;  // Y[9:5] = 01100 -> tilt_y = 01 (Expected, Y[9] = 0 and Y[3:0] >= 8)
        acl_data = 15'b0000_00000_00000; #10;  // Y[9:5] = 00000 -> tilt_y = 00 (Expected)
        acl_data = 15'b0000_11000_00000; #10;  // Y[9:5] = 11000 -> tilt_y = 11 (Expected)


        $finish;
    end
endmodule

