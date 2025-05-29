`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 
// Design Name: 
// Module Name: tb_async_counter_4bit
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


module tb_async_counter_4bit;
    reg clk;
    reg rst;
    wire [3:0] q;
    
    async_counter_4bit uut (
        .clk(clk), 
        .rst(rst), 
        .q(q)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst = 1;
        #10 rst = 0;
        
        #160 $finish;
    end
    
    initial begin
        $monitor("Time = %0t, Q = %b (%0d)", $time, q, q);
    end
    
endmodule
