`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto

// Create Date: 22.06.2025 
// Design Name: 
// Module Name: tb_pulse_generator
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


module tb_pulse_generator;


    parameter CLK_PERIOD = 10;   // 100MHz clock 
    parameter INTERVAL = 3;      // Pulse every 3 clock cycles
    
    // Signals
    reg clk;
    reg rst_n;
    wire pulse_out;
    
    // Instantiate 
    pulse_generator #(
        .INTERVAL(INTERVAL)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .pulse_out(pulse_out)
    );
    
    // Clock generation
    always #(CLK_PERIOD/2) clk = ~clk;
    
    // Test sequence
    initial begin
        // Initialize
        clk = 0;
        rst_n = 0;        // Assert reset 
        

        
        // Release reset after 100ns
        #100 rst_n = 1;
      
        
        // Wait for 3 complete pulse intervals
        #(3 * INTERVAL * CLK_PERIOD);
        
        // Test reset during operation
        rst_n = 0;
        #50 rst_n = 1;
        
        // Wait for 2 more pulse intervals
        #(2 * INTERVAL * CLK_PERIOD);
        
        // End simulation
        $finish;
    end
    
    // Monitoring
    initial begin
        $monitor("Time = %tns: clk = %b, rst_n = %b, pulse_out = %b, counter = %0d", 
                 $time, clk, rst_n, pulse_out, uut.counter);
    end
 

endmodule
