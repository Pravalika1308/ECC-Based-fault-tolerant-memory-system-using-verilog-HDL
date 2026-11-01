`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2026 13:55:54
// Design Name: 
// Module Name: ecc_memory
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


module ecc_memory (
    input  wire        clk,
    input  wire        we,
    input  wire [5:0]  addr,
    input  wire [71:0] data_in,
    output reg  [71:0] data_out
);

    // 64-word memory, each word is 72 bits
    reg [71:0] memory [0:63];

    always @(posedge clk) begin
        if (we)
            memory[addr] <= data_in;

        data_out <= memory[addr];
    end

endmodule