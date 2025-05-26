`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: binary_to_gray
// Description: 8-bit binary to Gray code converter
//              G[7] = B[7]
//              G[i] = B[i+1] ^ B[i] for i = 6:0
//////////////////////////////////////////////////////////////////////////////////

module binary_to_gray(
    input  [7:0] bin,   // Binary input
    output [7:0] gray   // Gray code output
);

    assign gray[7] = bin[7];  // MSB stays same
    assign gray[6:0] = bin[7:1] ^ bin[6:0];  // XOR adjacent bits

endmodule
