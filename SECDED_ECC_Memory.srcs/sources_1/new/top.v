`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2026 13:59:46
// Design Name: 
// Module Name: top
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



module top (
    input  wire clk,
    input  wire [3:0] sw,

    input  wire btn_write,
    input  wire btn_single,
    input  wire btn_double,

    output wire led_single,
    output wire led_double,
    output wire led_status,
    output wire led_data
);

    // ------------------------------------------------
    // Fixed test data
    // ------------------------------------------------
    wire [63:0] test_data = 64'h1234_5678_ABCD_EF01;

    // Use switches SW0-SW3 as memory address 0-15
    wire [5:0] addr = {2'b00, sw};

    // ------------------------------------------------
    // Button one-pulse generation
    // ------------------------------------------------
    reg write_d = 1'b0;
    reg single_d = 1'b0;
    reg double_d = 1'b0;

    always @(posedge clk) begin
        write_d  <= btn_write;
        single_d <= btn_single;
        double_d <= btn_double;
    end

    wire we = btn_write & ~write_d;
    wire inject_single = btn_single;
    wire inject_double = btn_double;

    // ------------------------------------------------
    // ECC signals
    // ------------------------------------------------
    wire [71:0] encoded_codeword;
    wire [71:0] stored_codeword;
    wire [71:0] faulty_codeword;

    wire [63:0] decoded_data;

    // ------------------------------------------------
    // ECC Encoder
    // ------------------------------------------------
    ecc_encoder encoder_inst (
        .data_in(test_data),
        .codeword_out(encoded_codeword)
    );

    // ------------------------------------------------
    // ECC Memory
    // ------------------------------------------------
    ecc_memory memory_inst (
        .clk(clk),
        .we(we),
        .addr(addr),
        .data_in(encoded_codeword),
        .data_out(stored_codeword)
    );

    // ------------------------------------------------
    // Fault Injector
    // ------------------------------------------------
    fault_injector fault_inst (
        .codeword_in(stored_codeword),
        .inject_single(inject_single),
        .inject_double(inject_double),
        .codeword_out(faulty_codeword)
    );

    // ------------------------------------------------
    // ECC Decoder
    // ------------------------------------------------
    ecc_decoder decoder_inst (
        .codeword_in(faulty_codeword),
        .data_out(decoded_data),
        .single_error(led_single),
        .double_error(led_double)
    );

    // ------------------------------------------------
    // Status LEDs
    // ------------------------------------------------

    // LED2 = write/status indication
    assign led_status = we;

    // LED3 = decoded data matches test data
    assign led_data = (decoded_data == test_data);

endmodule