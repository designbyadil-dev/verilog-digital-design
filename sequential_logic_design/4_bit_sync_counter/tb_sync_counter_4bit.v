`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 30.05.2025
// Design Name: 
// Module Name: tb_sync_counter_4bit
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


module tb_sync_counter_4bit;

    // Inputs
    reg clk;
    reg rst;
    
    // Outputs
    wire [3:0] q;
    
    // Instantiate Unit Under Test
    sync_counter_4bit uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Reset control
    initial begin
        rst = 1'b1;
        #10 rst = 1'b0;
        #160 $finish;
    end
    
    // Monitoring
    initial begin
        $monitor("Time = %0t ns, Q = %4b (%0d)", 
                $time, q, q);
    end
    
endmodule
