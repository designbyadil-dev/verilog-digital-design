`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 25.05.2025 
// Design Name: 
// Module Name: full_adder_nand
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


module full_adder_nand(
    input A, B, Cin,
    output S, Cout
);
    // Internal wires for gate connections
    wire w1, w2, w3, w4;  
    wire w5, w6, w7, w8;  
    wire w9, w10;         
    
    // First XOR stage: 
    nand G1(w1, A, B);
    nand G2(w2, A, w1);
    nand G3(w3, B, w1);
    nand G4(w4, w2, w3);  
    
    // Second XOR stage: 
    nand G5(w5, w4, Cin);
    nand G6(w6, w4, w5);
    nand G7(w7, Cin, w5);
    nand G8(S, w6, w7);   
    
    // Carry generation using 3 NAND gates
    nand G9(w9, A, B);        
    nand G10(w10, Cin, w4);   
    nand G11(Cout, w9, w10); 
     
endmodule
