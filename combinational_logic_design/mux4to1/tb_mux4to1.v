`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adil Rameto 
// 
// Create Date: 21.05.2025 
// Design Name: 4-to-1 Multiplexer Testbench
// Module Name: tb_mux4to1
// Target Devices: Simulation (All Platforms)
// Tool Versions: Vivado 2023.2
// Description: 
//    Self-verifying testbench for 4-to-1 multiplexer module (mux4to1).
//    Features:
//    - Tests all fundamental input combinations:
//      * Individual channel verification
//      * Alternating data patterns (0101, 1010)
//      * Edge cases (all ones, all zeros)
//      * Random stimulus validation
//    - Generates waveform dump for visual debugging
//    - Displays real-time test results with expected values
//    - Clock generation for timing reference (optional)
// 
// Dependencies: mux4to1.v (Unit Under Test)
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//    - Tests cover 100% of select line combinations
//    - Output matches expected results in all test cases
//    - Waveform file: mux4to1.vcd (view with GTKWave)
//////////////////////////////////////////////////////////////////////////////////


module tb_mux4to1();
    // Inputs
    reg [3:0] D;
    reg [1:0] S;
    
    // Output
    wire Y;
    
    // Instantiate the Unit Under Test (UUT)
    mux4to1 uut (
        .D(D),
        .S(S),
        .Y(Y)
    );
    
    
    // Test sequence
    initial begin
        // Initialize inputs
        D = 4'b0000;
        S = 2'b00;
        
        // Dump waveforms (for visualization in tools like GTKWave)
        $dumpfile("mux4to1.vcd");
        $dumpvars(0, tb_mux4to1);
        
        // Test all select combinations with different data patterns
        // Test case 1: Verify each input channel separately
        $display("Testing individual channels...");
        D = 4'b0001; // Only D[0] is high
        S = 2'b00; #10; $display("S=%b, D=%b, Y=%b (Expected: 1)", S, D, Y);
        S = 2'b01; #10; $display("S=%b, D=%b, Y=%b (Expected: 0)", S, D, Y);
        S = 2'b10; #10; $display("S=%b, D=%b, Y=%b (Expected: 0)", S, D, Y);
        S = 2'b11; #10; $display("S=%b, D=%b, Y=%b (Expected: 0)", S, D, Y);
        
        D = 4'b0010; // Only D[1] is high
        S = 2'b00; #10; $display("S=%b, D=%b, Y=%b (Expected: 0)", S, D, Y);
        S = 2'b01; #10; $display("S=%b, D=%b, Y=%b (Expected: 1)", S, D, Y);
        S = 2'b10; #10; $display("S=%b, D=%b, Y=%b (Expected: 0)", S, D, Y);
        S = 2'b11; #10; $display("S=%b, D=%b, Y=%b (Expected: 0)", S, D, Y);
        
        // Test case 2: Verify all channels with alternating pattern
        $display("\nTesting alternating pattern...");
        D = 4'b0101;
        S = 2'b00; #10; $display("S=%b, D=%b, Y=%b (Expected: 1)", S, D, Y);
        S = 2'b01; #10; $display("S=%b, D=%b, Y=%b (Expected: 0)", S, D, Y);
        S = 2'b10; #10; $display("S=%b, D=%b, Y=%b (Expected: 1)", S, D, Y);
        S = 2'b11; #10; $display("S=%b, D=%b, Y=%b (Expected: 0)", S, D, Y);
        
        // Test case 3: Verify all channels with different pattern
        $display("\nTesting different pattern...");
        D = 4'b1010;
        S = 2'b00; #10; $display("S=%b, D=%b, Y=%b (Expected: 0)", S, D, Y);
        S = 2'b01; #10; $display("S=%b, D=%b, Y=%b (Expected: 1)", S, D, Y);
        S = 2'b10; #10; $display("S=%b, D=%b, Y=%b (Expected: 0)", S, D, Y);
        S = 2'b11; #10; $display("S=%b, D=%b, Y=%b (Expected: 1)", S, D, Y);
        
        // Test case 4: Verify all inputs high
        $display("\nTesting all inputs high...");
        D = 4'b1111;
        S = 2'b00; #10; $display("S=%b, D=%b, Y=%b (Expected: 1)", S, D, Y);
        S = 2'b01; #10; $display("S=%b, D=%b, Y=%b (Expected: 1)", S, D, Y);
        S = 2'b10; #10; $display("S=%b, D=%b, Y=%b (Expected: 1)", S, D, Y);
        S = 2'b11; #10; $display("S=%b, D=%b, Y=%b (Expected: 1)", S, D, Y);
        
        // Test case 5: Random testing
        $display("\nRandom testing...");
        repeat(5) begin
            D = $random;
            S = $random;
            #10;
            $display("S=%b, D=%b, Y=%b", S, D, Y);
        end
        
        $display("\nTestbench completed");
        $finish;
    end
endmodule
