`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 27.05.2025 
// Design Name: 
// Module Name: tb_barrel_shifter
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


module tb_barrel_shifter();
    reg [7:0] data_in;
    reg [2:0] shift;
    reg dir;
    wire [7:0] data_out;
    
    // Instantiate the barrel shifter
    barrel_shifter_8bit uut (
        .data_in(data_in),
        .shift(shift),
        .dir(dir),
        .data_out(data_out)
    );
    
    initial begin
        // Test right shifts
        dir = 0;
        data_in = 8'b10101010;
        shift = 0; #10;
        shift = 1; #10;
        shift = 2; #10;
        shift = 3; #10;
        shift = 4; #10;
        
        // Test left shifts
        dir = 1;
        data_in = 8'b10101010;
        shift = 0; #10;
        shift = 1; #10;
        shift = 2; #10;
        shift = 3; #10;
        shift = 4; #10;
        
        // Additional test cases
        dir = 0;
        data_in = 8'b11110000;
        shift = 2; #10;
        
        dir = 1;
        data_in = 8'b00001111;
        shift = 3; #10;
        
        $finish;
    end
    
    initial begin
        $monitor("Time=%0t dir=%b data_in=%b shift=%d data_out=%b",
                 $time, dir, data_in, shift, data_out);
    end
    
endmodule
