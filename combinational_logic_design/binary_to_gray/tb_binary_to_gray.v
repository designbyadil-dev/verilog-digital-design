`timescale 1ns / 1ps

module tb_binary_to_gray;
    reg [7:0] bin;    // Binary input
    wire [7:0] gray;  // Gray output

    // Instantiate DUT
    binary_to_gray dut (
        .bin(bin),
        .gray(gray)
    );

    // Test stimulus & verification
    initial begin
        $display("Starting testbench...");
        
        // Test known cases
        bin = 8'b00000000; #10; // Gray = 00000000
        check_gray(8'b00000000);

        bin = 8'b00000001; #10; // Gray = 00000001
        check_gray(8'b00000001);

        bin = 8'b00000011; #10; // Gray = 00000010
        check_gray(8'b00000010);

        bin = 8'b00000111; #10; // Gray = 00000100
        check_gray(8'b00000100);

        bin = 8'b11111111; #10; // Gray = 10000000
        check_gray(8'b10000000);

        // Test random cases 
        repeat(10) begin
            bin = $random; #10;
            $display("Binary: %b ? Gray: %b", bin, gray);
        end

        $display("Testbench completed.");
        $finish;
    end

    // Helper task to verify Gray output
    task check_gray(input [7:0] expected_gray);
        if (gray !== expected_gray) begin
            $error("Error: Binary=%b ? Expected Gray=%b, Got Gray=%b", 
                   bin, expected_gray, gray);
        end
    endtask

endmodule