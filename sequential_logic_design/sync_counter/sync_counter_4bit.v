`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Adil Rameto
// 
// Create Date: 30.05.2025
// Design Name: 
// Module Name: sync_counter_4bit
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


module sync_counter_4bit(

    input       clk,
    input       rst,
    output [3:0] q
    
);

    
    // Toggle enable logic
    assign t1 = q[0];                // Toggle FF1 when Q0 is 1
    assign t2 = q[0] & q[1];         // Toggle FF2 when Q0 and Q1 are 1
    assign t3 = q[0] & q[1] & q[2];  // Toggle FF3 when Q0, Q1, and Q2 are 1
    
    // Instantiate four T flip-flops with common clock
    t_ff ff0 (
        .clk(clk),
        .rst(rst),
        .q(q[0])
    );
    
    t_ff ff1 (
        .clk(clk & t1),
        .rst(rst),
        .q(q[1])
    );
    
    t_ff ff2 (
        .clk(clk & t2),
        .rst(rst),
        .q(q[2])
    );
    
    t_ff ff3 (
        .clk(clk & t3),
        .rst(rst),
        .q(q[3])
    );
    
endmodule
