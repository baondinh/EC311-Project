`timescale 1ns / 1ps


module acl_data_decoder (
    input [14:0] acl_data,  
    output reg [1:0] tilt_y 
);
    wire [4:0] Y = acl_data[9:5];

    always @(*) begin
        // Default values
        tilt_y = 2'b00;

        // Set tilt_y[1] to indicate MSB (sign or extreme condition)
        tilt_y[1] = Y[4];
        // Threshold 8 
        if (Y[3:0] >= 4'b1000) // Values 8 to 15
            tilt_y[0] = 1;
        else                    // Values 0 to 7
            tilt_y[0] = 0;
    end
endmodule

