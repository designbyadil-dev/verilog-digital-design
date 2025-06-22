`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer:  adil rameto
// 
// Create Date: 22.06.2025 
// Design Name: 
// Module Name: pulse_generator
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


module pulse_generator #(
    parameter INTERVAL = 10  // Number of clock cycles between pulses
)(
    input wire clk,          
    input wire rst_n,        
    output reg pulse_out     
);

    reg [31:0] counter;      

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            pulse_out <= 0;
        end
        else begin
        
            pulse_out <= 0;
            
            // Counter
            if (counter == INTERVAL-1) begin
                counter <= 0;
                pulse_out <= 1;  // Generate pulse
            end
            else begin
                counter <= counter + 1;
            end
        end
    end

endmodule
