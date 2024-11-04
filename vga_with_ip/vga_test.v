`timescale 1ns / 1ps

module vga_syncIndex_tb;

    // Inputs
    reg clock;
    reg reset;
    reg [1:0] sel_module;
    reg [7:0] val;

    // Outputs
    wire hsync;
    wire vsync;
    wire [3:0] red;
    wire [3:0] green;
    wire [3:0] blue;

    // Instantiate the Unit Under Test (UUT)
    vga_syncIndex uut (
        .clock(clock),
        .reset(reset),
        .sel_module(sel_module),
        .val(val),
        .hsync(hsync),
        .vsync(vsync),
        .red(red),
        .green(green),
        .blue(blue)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 100 MHz clock (10ns period)
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        reset = 1;
        sel_module = 2'b00; // Start with original image display
        val = 8'd0;

        // Apply reset for a short period and release it
        #20;
        reset = 0;

        // Test original image
        #100000; // Wait for 100,000 ns to observe the output in the original mode

        // Switch to grayscale mode
        sel_module = 2'b01;
        #100000; // Wait for 100,000 ns

        // Switch to Sobel Edge detection
        sel_module = 2'b10;
        #100000; // Wait for 100,000 ns

        // Switch to Gaussian blur
        sel_module = 2'b11;
        #100000; // Wait for 100,000 ns

        // Stop the simulation
        $stop;
    end

    // Monitor signals to debug
    initial begin
        $monitor("Time=%0dns, sel_module=%b, hsync=%b, vsync=%b, red=%b, green=%b, blue=%b", 
                  $time, sel_module, hsync, vsync, red, green, blue);
    end

endmodule
