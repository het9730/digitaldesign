`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 12:11:52
// Design Name: 
// Module Name: carry_skip_adder_8bit
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


module carry_skip_adder_8bit(
input [7:0]a,
input [7:0]b,
input cin,
output [7:0]sum,
output cout
    );
    
wire cout0,skip,c1;
wire [3:0]p0;
 
ripple_addet_4bit rca1(
.a(a[3:0]),
.b(b[3:0]),
.cin(cin),
.sum(sum[3:0]),
.cout(cout0)
);

assign p0 = a[3:0] ^ b[3:0] ;
assign skip = &p0;
assign c1 = skip ? cout0: cin;

ripple_addet_4bit rca2 (
.a(a[7:4]),
.b(b[7:4]),
.cin(c1),
.sum(sum[7:4]),
.cout(cout)
);
endmodule
