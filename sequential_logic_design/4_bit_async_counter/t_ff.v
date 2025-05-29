`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 29.05.2025 
// Design Name: 
// Module Name: t_ff
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


module t_ff(
    input clk,
    input rst,
    output reg q
);
    always @(negedge clk or posedge rst) begin
        if (rst) 
            q <= 1'b0;
        else 
            q <= ~q;
    end
    
    
endmodule
