`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 25.05.2025 
// Design Name: 
// Module Name: priority_encoder_4bit
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


module priority_encoder_4bit (
    input [3:0] D,
    output reg [1:0] Y,
    output reg V
);

always @(*) begin
    V = 1'b1;
    casex(D)
        4'b1xxx: Y = 2'b11; // Highest priority (D3)
        4'b01xx: Y = 2'b10; // D2
        4'b001x: Y = 2'b01; // D1
        4'b0001: Y = 2'b00; // D0
        default: begin
            Y = 2'b00;
            V = 1'b0;       // No valid input
        end
    endcase
end

endmodule
