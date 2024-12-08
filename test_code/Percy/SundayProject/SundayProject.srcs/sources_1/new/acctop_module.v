`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 05:57:53 PM
// Design Name: 
// Module Name: acctop_module
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


module acctop_module(
    input iclk,               
    input miso,               
    output sclk,             
    output mosi,            
    output cs,              
    output wire [1:0] tilt_y      
);

    wire [14:0] acl_data;

    accelerometer accel_inst (
        .iclk(iclk),
        .miso(miso),
        .sclk(sclk),
        .mosi(mosi),
        .cs(cs),
        .acl_data(acl_data)
    );

    acl_data_decoder decoder_inst (
        .acl_data(acl_data),
        .tilt_y(tilt_y)
    );
endmodule
