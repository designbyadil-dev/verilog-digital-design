`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: adil rameto
// 
// Create Date: 28.05.2025 19:20:04
// Design Name: 
// Module Name: tb_bcd_to_7seg
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


module tb_bcd_to_7seg;

    reg [3:0] bcd;
    wire [6:0] seg;
    
    bcd_to_7seg uut (
      .bcd(bcd), 
      .seg(seg)
    );
    
    initial begin
        $monitor("Time = %0t, BCD = %b, Segments = %b", 
                $time, bcd, seg);
        
        bcd = 4'b0000; #10; // 0
        bcd = 4'b0001; #10; // 1
        bcd = 4'b0010; #10; // 2
        bcd = 4'b0011; #10; // 3
        bcd = 4'b0100; #10; // 4
        bcd = 4'b0101; #10; // 5
        bcd = 4'b0110; #10; // 6
        bcd = 4'b0111; #10; // 7
        bcd = 4'b1000; #10; // 8
        bcd = 4'b1001; #10; // 9
        bcd = 4'b1010; #10; // Invalid
        
        $finish;
    end
    
endmodule
