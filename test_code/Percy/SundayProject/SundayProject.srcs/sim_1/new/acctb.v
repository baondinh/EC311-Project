`timescale 1ns / 1ps

module acctb;

    // Declare inputs, outputs, and internal signals
    reg iclk;                // Simulated 4MHz clock
    reg miso;                // Simulated MISO input
    wire sclk;               // 1MHz clock
    wire mosi;               // MOSI signal
    wire cs;                 // Chip select
    wire [1:0] tilt_y;       // Output from the acl_data_decoder

    // Instantiate the top module
    acctop_module uut (
        .iclk(iclk),
        .miso(miso),         // Connect simulated MISO input
        .sclk(sclk),
        .mosi(mosi),
        .cs(cs),
        .tilt_y(tilt_y)
    );

    // Generate 4MHz clock
    initial begin
        iclk = 0;
        forever #125 iclk = ~iclk; // 4MHz clock (T = 250ns)
    end

    // Test stimulus
    reg [14:0] acl_data;     // Simulated acl_data (15 bits)
    initial begin
        miso = 0;            // Initialize MISO signal
        acl_data = 15'b000_01000_01000_0; // Initial data

        // Example test cases for acl_data
        #0   acl_data = 15'b000_01000_01000_0;   // Balanced X, Y, Z (no tilt)
        #200 acl_data = 15'b000_10000_01000_0;   // X-axis high, possible tilt
        #400 acl_data = 15'b000_00100_10000_0;   // Y-axis high, possible tilt
        #600 acl_data = 15'b000_00000_00001_0;   // Z-axis high (no tilt)
        #800 acl_data = 15'b000_01111_11111_0;   // Random extreme values
        #1000 acl_data = 15'b000_00000_00000_0;  // No data (idle case)

        #1500 $finish;   // End simulation after a sufficient time
    end

    // Monitor output signals
    initial begin
        $monitor("Time: %t | ACL Data: %b | Tilt_Y: %b | SCLK: %b | MOSI: %b | CS: %b", 
                 $time, acl_data, tilt_y, sclk, mosi, cs);
    end

endmodule

