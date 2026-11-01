`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2026 14:05:39
// Design Name: 
// Module Name: fault_injector
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


module fault_injector (
    input  wire [71:0] codeword_in,
    input  wire        inject_single,
    input  wire        inject_double,
    output reg  [71:0] codeword_out
);

    always @(*) begin

        // Start with original codeword
        codeword_out = codeword_in;

        // Single-bit error injection
        if (inject_single) begin
            codeword_out[10] = ~codeword_out[10];
        end

        // Double-bit error injection
        if (inject_double) begin
            codeword_out[10] = ~codeword_out[10];
            codeword_out[20] = ~codeword_out[20];
        end

    end

endmodule