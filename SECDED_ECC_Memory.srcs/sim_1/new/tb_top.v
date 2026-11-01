
`timescale 1ns / 1ps

module tb_top;

    reg clk;
    reg [3:0] sw;

    reg btn_write;
    reg btn_single;
    reg btn_double;

    wire led_single;
    wire led_double;
    wire led_status;
    wire led_data;

    // Instantiate the current FPGA top module
    top uut (
        .clk(clk),
        .sw(sw),
        .btn_write(btn_write),
        .btn_single(btn_single),
        .btn_double(btn_double),
        .led_single(led_single),
        .led_double(led_double),
        .led_status(led_status),
        .led_data(led_data)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        sw = 4'b0000;
        btn_write = 0;
        btn_single = 0;
        btn_double = 0;

        // Allow the design to initialize
        #20;

        // TEST 1: Normal operation
        btn_write = 1;
        #10;
        btn_write = 0;
        #20;

        $display("TEST 1: Normal operation");
        $display("LED data match = %b", led_data);

        // TEST 2: Single-bit error
        btn_single = 1;
        #10;
        $display("TEST 2: Single-bit error");
        $display("Single error LED = %b", led_single);
        btn_single = 0;
        #10;

        // TEST 3: Double-bit error
        btn_double = 1;
        #10;
        $display("TEST 3: Double-bit error");
        $display("Double error LED = %b", led_double);
        btn_double = 0;
        #10;

        // TEST 4: Change memory address
        sw = 4'b0001;
        btn_write = 1;
        #10;
        btn_write = 0;
        #20;

        $display("TEST 4: Address 1");
        $display("LED data match = %b", led_data);

        #10;
        $finish;
    end

endmodule
