`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 26.05.2025 
// Design Name: 
// Module Name: tb_comp_8bit
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


module tb_comp_8bit;
    reg [7:0] A, B;
    wire G, E, L;
    
    comp_8bit uut(
        .A(A), 
        .B(B), 
        .G(G), 
        .E(E), 
        .L(L)
    );
    
    initial begin
        // Test case groups
        // 1. Equal numbers
        A = 8'h00; B = 8'h00;
        #10 A = 8'hFF; B = 8'hFF;
        #10 A = 8'hA5; B = 8'hA5;
        
        // 2. A > B cases
        #10 A = 8'h01; B = 8'h00;  // Lower difference
        #10 A = 8'h10; B = 8'h0F;  // Upper difference
        #10 A = 8'hF1; B = 8'hF0;  // Both  different
        
        // 3. A < B cases
        #10 A = 8'h00; B = 8'h01;
        #10 A = 8'h0F; B = 8'h10;
        #10 A = 8'hF0; B = 8'hF1;
        
        // 4. Boundary cases
        #10 A = 8'h80; B = 8'h7F;  // MSB difference
        #10 A = 8'h7F; B = 8'h80;
        #10 A = 8'hFF; B = 8'h00;
        #10 A = 8'h00; B = 8'hFF;
        
        #20 $finish;
    end
    
    initial begin
        $monitor("Time = %t, A = %h, B = %h, G = %b, E = %b, L = %b",
                 $time, A, B, G, E, L);
    end
endmodule
