`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 25.05.2025
// Design Name: 
// Module Name: tb_full_adder_nand
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


module tb_full_adder_nand;
    // Inputs
    reg A, B, Cin;
    // Outputs
    wire S, Cout;
    
    // Instantiate unit under test
    full_adder_nand uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));
    
    initial begin
        // Test all combinations
        $display("Time\tA B Cin\tS Cout");
        $monitor("%4t\t%b %b  %b\t%b  %b", $time, A, B, Cin, S, Cout);
        
        A=0; B=0; Cin=0; #10;
        A=0; B=0; Cin=1; #10;
        A=0; B=1; Cin=0; #10;
        A=0; B=1; Cin=1; #10;
        A=1; B=0; Cin=0; #10;
        A=1; B=0; Cin=1; #10;
        A=1; B=1; Cin=0; #10;
        A=1; B=1; Cin=1; #10;
        
        #10 $finish;
    end
endmodule
