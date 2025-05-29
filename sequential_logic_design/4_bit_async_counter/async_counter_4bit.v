`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 29.05.2025 
// Design Name: 
// Module Name: async_counter_4bit
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


module async_counter_4bit(
    input clk,
    input rst,
    output [3:0] q
);
    
    t_ff ff0 (.clk(clk), .rst(rst), .q(q[0]));
    t_ff ff1 (.clk(q[0]), .rst(rst), .q(q[1]));
    t_ff ff2 (.clk(q[1]), .rst(rst), .q(q[2]));
    t_ff ff3 (.clk(q[2]), .rst(rst), .q(q[3]));
    
endmodule
