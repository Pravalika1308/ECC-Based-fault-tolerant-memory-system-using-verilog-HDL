`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2026 18:19:24
// Design Name: 
// Module Name: tb_ecc_decoder
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


`timescale 1ns/1ps

module tb_ecc_decoder;

    reg  [71:0] codeword_in;
    wire [63:0] data_out;
    wire        single_error;
    wire        double_error;

    ecc_decoder uut (
        .codeword_in(codeword_in),
        .data_out(data_out),
        .single_error(single_error),
        .double_error(double_error)
    );

    initial begin

        // Test 1: No error
        codeword_in = 72'h000000000000000000;
        #10;

        $display("Test 1: NO ERROR");
        $display("Data Out = %h, Single Error = %b, Double Error = %b",
                 data_out, single_error, double_error);


        // Test 2: Single-bit error
        codeword_in = 72'h000000000000000001;
        #10;

        $display("Test 2: SINGLE BIT ERROR");
        $display("Data Out = %h, Single Error = %b, Double Error = %b",
                 data_out, single_error, double_error);


        // Test 3: Another single-bit error
        codeword_in = 72'h000000000000000002;
        #10;

        $display("Test 3: SINGLE BIT ERROR");
        $display("Data Out = %h, Single Error = %b, Double Error = %b",
                 data_out, single_error, double_error);


        // Test 4: Double-bit error
        codeword_in = 72'h000000000000000003;
        #10;

        $display("Test 4: DOUBLE BIT ERROR");
        $display("Data Out = %h, Single Error = %b, Double Error = %b",
                 data_out, single_error, double_error);


        $finish;

    end

endmodule
