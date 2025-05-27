`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 27.05.2025 
// Design Name: 
// Module Name: barrel_shifter_8bit
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


module barrel_shifter_8bit (
    input [7:0] data_in,
    input [2:0] shift,
    input dir,
    output reg [7:0] data_out
);
    
    always @(*) begin
        if (dir) begin // Left shift
            data_out = data_in << shift;
        end else begin // Right shift
            data_out = data_in >> shift;
        end
    end
    
endmodule
