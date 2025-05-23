`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adil Rameto
// 
// Create Date: 24.05.2025 00:27:28
// Design Name: 
// Module Name: parity_gen
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



module parity_gen(
    input wire A, B, C,    // 3-bit input
    output wire P          // Parity bit output
);

    assign P = A ^ B ^ C;  // XOR operation for even parity

endmodule
