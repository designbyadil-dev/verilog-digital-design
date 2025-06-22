`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
 
// Create Date: 22.06.2025 
// Design Name: 
// Module Name: clk_divider
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


module clk_divider #(
    parameter DIVISOR = 2
)(
    input wire clk_in,     // Input clock
    input wire rst_n,      // Active-low reset
    output reg clk_out     // Divided clock output
);

    reg [63:0] cnt;       // 64-bit counter 

    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 64'd0;
            clk_out <= 1'b0;
        end
        else begin
            cnt <= (cnt >= DIVISOR-1) ? 64'd0 : cnt + 64'd1;
            clk_out <= (cnt < DIVISOR/2) ? 1'b1 : 1'b0;
        end
    end

endmodule
