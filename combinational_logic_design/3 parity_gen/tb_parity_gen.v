`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adil Rameto
// 
// Create Date: 24.05.2025 00:28:25
// Design Name: 
// Module Name: tb_parity_gen
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


module tb_parity_gen;
    // Inputs
    reg A, B, C;
    // Outputs
    wire P;
    
    // Instantiate the Unit Under Test (UUT)
    parity_gen uut (
        .A(A), 
        .B(B), 
        .C(C), 
        .P(P)
    );
    
    initial begin
        // Initialize Inputs
        A = 0; B = 0; C = 0;
        
        // Wait 100 ns for global reset
        #100;
        
        // Stimulus
        A=0; B=0; C=0; #100; // P=0
        A=0; B=0; C=1; #100; // P=1
        A=0; B=1; C=0; #100; // P=1
        A=0; B=1; C=1; #100; // P=0
        A=1; B=0; C=0; #100; // P=1
        A=1; B=0; C=1; #100; // P=0
        A=1; B=1; C=0; #100; // P=0
        A=1; B=1; C=1; #100; // P=1
        
        #100 $finish;
    end
    
    initial begin
        $monitor("Time=%0t A=%b B=%b C=%b P=%b", 
                 $time, A, B, C, P);
    end
endmodule
