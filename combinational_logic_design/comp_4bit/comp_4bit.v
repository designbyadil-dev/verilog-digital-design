`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 26.05.2025 
// Design Name: 
// Module Name: comp_4bit
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

module comp_4bit(
    input [3:0] A, B,
    output reg G, E, L
);

always @(*) begin
    G = 1'b0;
    E = 1'b0;
    L = 1'b0;
    
    if (A > B)        
        G = 1'b1;
    else if (A == B)  
        E = 1'b1;
    else              
        L = 1'b1;
end

endmodule
