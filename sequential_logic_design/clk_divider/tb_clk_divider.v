`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto

// 
// Create Date: 22.06.2025 
// Design Name: 
// Module Name: tb_clk_divider
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



module tb_clk_divider;

    // Parameters
    parameter CLK_PERIOD = 10;   // 100MHz clock 
    parameter DIVISOR = 6;       
    
    // Signals
    reg clk_in;
    reg rst_n;
    wire clk_out;
    
    // Instantiate UUT 
    clk_divider #(
        .DIVISOR(DIVISOR)
    ) uut (
        .clk_in(clk_in),
        .rst_n(rst_n),
        .clk_out(clk_out)
    );
    
    // Clock generation
    always #(CLK_PERIOD/2) clk_in = ~clk_in;
    
    // Test sequence
    initial begin
        // Initialize
        clk_in = 0;
        rst_n = 0;        // Assert reset
       
        // Release reset after 100ns
        #100 rst_n = 1;
        
        #400;
   
        // Test reset during operation
        rst_n = 0;
        #50 rst_n = 1;
        

        #100 $finish;
    end
    

    
endmodule
