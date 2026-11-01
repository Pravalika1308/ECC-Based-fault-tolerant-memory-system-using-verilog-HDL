`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2026 17:26:14
// Design Name: 
// Module Name: ecc_encoder
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


module ecc_encoder (
    input  [63:0] data_in,
    output [71:0] codeword_out
);

    reg [71:0] codeword;
    integer i;
    integer data_index;
    reg parity;

    always @(*) begin

        // Clear codeword
        codeword = 72'b0;

        // Place 64 data bits into Hamming positions
        data_index = 0;

        for (i = 1; i <= 71; i = i + 1) begin
            if ((i != 1) && (i != 2) && (i != 4) &&
                (i != 8) && (i != 16) && (i != 32) &&
                (i != 64)) begin

                codeword[i-1] = data_in[data_index];
                data_index = data_index + 1;
            end
        end

        // Hamming parity bits
        for (i = 0; i < 7; i = i + 1) begin
            parity = 1'b0;

            for (data_index = 1; data_index <= 71; data_index = data_index + 1) begin
                if (((data_index & (1 << i)) != 0) &&
                    (data_index != (1 << i))) begin
                    parity = parity ^ codeword[data_index-1];
                end
            end

            codeword[(1 << i)-1] = parity;
        end

        // Overall parity bit for SEC-DED
        codeword[71] = ^codeword[70:0];

    end

    assign codeword_out = codeword;

endmodule