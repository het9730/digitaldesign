`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2025 13:51:46
// Design Name: 
// Module Name: ripple_addet_4bit
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


module ripple_addet_4bit(
    
input [3:0]a,b,
input cin,
output [3:0] sum,
output cout

);
  wire [3:0] c;  // Carry wires

    // Full adder instances
    fulladder fa0(a[0], b[0], cin, sum[0], c[0]);
    fulladder fa1(a[1], b[1], c[0], sum[1], c[1]);
    fulladder fa2(a[2], b[2], c[1], sum[2], c[2]);
    fulladder fa3(a[3], b[3], c[2], sum[3], cout);
    
    endmodule

module fulladder(
   input a,
   input b,
   input cin,
   output sum,
   output cout
   );
   assign sum = a ^ b ^ cin;
   assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
