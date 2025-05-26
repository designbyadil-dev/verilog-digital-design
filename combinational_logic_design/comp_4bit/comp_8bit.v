`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 26.05.2025
// Design Name: 
// Module Name: comp_8bit
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


module comp_8bit(
    input [7:0] A, B,
    output G, E, L
);

wire G_upper, E_upper, L_upper;
wire G_lower, E_lower, L_lower;

// Upper nibble comparison
comp_4bit upper_comp(
    .A(A[7:4]),
    .B(B[7:4]),
    .G(G_upper),
    .E(E_upper),
    .L(L_upper)
);

// Lower nibble comparison
comp_4bit lower_comp(
    .A(A[3:0]),
    .B(B[3:0]),
    .G(G_lower),
    .E(E_lower),
    .L(L_lower)
);

// Output logic
assign G = G_upper | (E_upper & G_lower);
assign E = E_upper & E_lower;
assign L = L_upper | (E_upper & L_lower);

endmodule
