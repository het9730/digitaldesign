`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2025 23:22:29
// Design Name: 
// Module Name: csa_32bit
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

module csa_32bit(
input [31:0]a,
input [31:0]b,
input cin,
output[31:0]sum,
output cout
    );
wire couta,coutb,coutc;

carry_select_adder_8bit csa_a (
.a(a[7:0]),
.b(b[7:0]),
.cin(cin),
.sum(sum[7:0]),
.cout(couta)
);

carry_select_adder_8bit csa_b (
.a(a[15:8]),
.b(b[15:8]),
.cin(couta),
.sum(sum[15:8]),
.cout(coutb)
);

carry_select_adder_8bit csa_c (
.a(a[23:16]),
.b(b[23:16]),
.cin(coutb),
.sum(sum[23:16]),
.cout(coutc)
);

carry_select_adder_8bit csa_d (
.a(a[31:24]),
.b(b[31:24]),
.cin(coutc),
.sum(sum[31:24]),
.cout(cout)
);

endmodule
