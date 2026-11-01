`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2026 17:31:00
// Design Name: 
// Module Name: tb_ecc_encoder
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




module tb_ecc_encoder;

    reg  [63:0] data_in;
    wire [71:0] codeword_out;

    // Instantiate ECC Encoder
    ecc_encoder uut (
        .data_in(data_in),
        .codeword_out(codeword_out)
    );

    initial begin

        // Test 1
        data_in = 64'h0000000000000000;
        #10;
        $display("Test 1: DATA = %h, CODEWORD = %h",
                 data_in, codeword_out);

        // Test 2
        data_in = 64'hFFFFFFFFFFFFFFFF;
        #10;
        $display("Test 2: DATA = %h, CODEWORD = %h",
                 data_in, codeword_out);

        // Test 3
        data_in = 64'h123456789ABCDEF0;
        #10;
        $display("Test 3: DATA = %h, CODEWORD = %h",
                 data_in, codeword_out);

        // Test 4
        data_in = 64'hA5A5A5A5A5A5A5A5;
        #10;
        $display("Test 4: DATA = %h, CODEWORD = %h",
                 data_in, codeword_out);

        $finish;
    end

endmodule