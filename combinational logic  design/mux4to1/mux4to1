`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 21.05.2025 
// Design Name: 4-to-1 Multiplexer (MUX)
// Module Name: mux4to1
// Tool Versions: Vivado 2023.2
// Description: 
//    A fully combinational 4-to-1 multiplexer with 2-bit select input.
//    The module routes one of four 1-bit data inputs (D[3:0]) to output Y
//    based on the binary value of select lines S[1:0]:
//      S=00 ? Y=D[0]
//      S=01 ? Y=D[1]
//      S=10 ? Y=D[2]
//      S=11 ? Y=D[3]
//    The implementation uses direct array indexing for optimal synthesis.
// 
// Dependencies: None (Standalone module)
// 
// Revision:
// Revision 0.01 - File Created
// Revision 0.02 - Optimized to use array indexing (21.05.2025)
//////////////////////////////////////////////////////////////////////////////////


module mux4to1(
    input [3:0] D,  // 4 input lines
    input [1:0] S,   // 2 select lines
    output Y
);
    assign Y = D[S];
endmodule
