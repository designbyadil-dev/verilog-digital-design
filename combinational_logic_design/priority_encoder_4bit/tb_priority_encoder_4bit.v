`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 25.05.2025 
// Design Name: 
// Module Name: tb_priority_encoder_4bit
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



module tb_priority_encoder_4bit;
    reg [3:0] D;
    wire [1:0] Y;
    wire V;
    
    // Instantiate the priority encoder
    priority_encoder_4bit uut (
        .D(D),
        .Y(Y),
        .V(V)
    );
    
    initial begin
        // Initialize inputs
        D = 4'b0000;
        
        // Test all possible input combinations
        #10 D = 4'b0000;
        #10 D = 4'b0001;
        #10 D = 4'b0010;
        #10 D = 4'b0011;
        #10 D = 4'b0100;
        #10 D = 4'b0101;
        #10 D = 4'b0110;
        #10 D = 4'b0111;
        #10 D = 4'b1000;
        #10 D = 4'b1001;
        #10 D = 4'b1010;
        #10 D = 4'b1011;
        #10 D = 4'b1100;
        #10 D = 4'b1101;
        #10 D = 4'b1110;
        #10 D = 4'b1111;
        
        // Additional test cases
        #10 D = 4'b0000;
        #10 D = 4'b0010;
        #10 D = 4'b0100;
        #10 D = 4'b1000;
        #10 $finish;
    end
    
    initial begin
        $monitor("Time = %0t, D = %b, Y = %b, V = %b", 
                 $time, D, Y, V);
    end
    
endmodule
