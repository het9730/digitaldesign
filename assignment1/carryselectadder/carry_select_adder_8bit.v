`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2025 14:05:01
// Design Name: 
// Module Name: carry_select_adder_8bit
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


module carry_select_adder_8bit(
input [7:0] a,b,
input cin,
output [7:0] sum,
output cout
);
wire [3:0] sum0, sum1;
wire c1, cout0, cout1;   
//lower 4-bit ripple carry adder
ripple_addet_4bit rca0 (
.a(a[3:0]),
.b(b[3:0]),
.cin(cin),
.sum(sum[3:0]),
.cout(c1)
 );
 //assuming carry in is not c1
 //in csa , for the upper 4 bits , we don't wait for the actual carry in (c1)
 //we precompute both the result for c1 = 0 and c1 = 1
 //they are assume carry not real 
 //whenver we get carry , using mux we can take output from precompute results
 //which decrese delays ad make sysytem faster
 //upper 4 bit ripple carry adder assuming carry in = 0
 ripple_addet_4bit rca1 (
 .a(a[7:4]),
 .b(b[7:4]),
 .cin(1'b0),
 .sum(sum0),
 .cout(cout0)
 );
 //upper 4 bit ripple carry adder assuming carry in = 1
 ripple_addet_4bit rca2 ( 
 .a(a[7:4]),
 .b(b[7:4]),
 .cin(1'b1),
 .sum(sum1),
 .cout(cout1)
 );
 
 //select correct sum and cout
 assign sum[7:4] = (c1 == 1'b0) ? sum0 : sum1;
 assign cout = (c1 == 1'b0) ? cout0 : cout1; 
 
endmodule
