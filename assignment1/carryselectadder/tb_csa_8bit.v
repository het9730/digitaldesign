`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2025 15:22:23
// Design Name: 
// Module Name: tb_csa_8bit
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
module tb_csa_8bit;
    // Inputs 
    reg [7:0] a, b;
    reg cin;

    // Outputs
    wire [7:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    carry_select_adder_8bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Display header
        $display("Time\t a\t\t b\t\t cin\t | sum\t\t cout");
        $display("-----------------------------------------------");

        // Apply test cases 
        a = 8'b00001111; b = 8'b00000001; cin = 1; #10;
        $display("%0dns\t %b\t %b\t %b\t | %b\t %b", $time, a, b, cin, sum, cout);

        a = 8'b10101010; b = 8'b01010101; cin = 0; #10;
        $display("%0dns\t %b\t %b\t %b\t | %b\t %b", $time, a, b, cin, sum, cout);

        a = 8'b11111111; b = 8'b11111111; cin = 1; #10;
        $display("%0dns\t %b\t %b\t %b\t | %b\t %b", $time, a, b, cin, sum, cout);

        // Add more test cases if needed

        $finish; // End simulation
    end
endmodule



