`timescale 1ns/1ps

module tb_traffic_light;

    reg clk;
    reg reset;

    wire [1:0] NS_light;
    wire [1:0] EW_light;

    // Instantiate DUT
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .NS_light(NS_light),
        .EW_light(EW_light)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin

        // Generate waveform
        $dumpfile("traffic_light_tb.vcd");
        $dumpvars(0, tb_traffic_light);

        // Initial values
        clk = 0;
        reset = 1;

        // Release reset
        #10 reset = 0;

        // Run simulation
        #100;

        $finish;
    end

    // Display output
    initial begin
        $monitor(
            "Time = %0t ns | Reset = %b | NS_light = %b | EW_light = %b",
            $time,
            reset,
            NS_light,
            EW_light
        );
    end

endmodule
