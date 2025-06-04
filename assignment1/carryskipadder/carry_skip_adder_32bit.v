`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 14:22:56
// Design Name: 
// Module Name: carry_skip_adder_32bit
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


module carry_skip_adder_32bit(
input [31:0] a,
input [31:0]b,
input cin,
input [31:0] sum,
output cout
    );
    wire cout0,cout1,cout2;
    
carry_skip_adder_8bit csa0(
.a(a[7:0]),
.b(b[7:0]),
.cin(cin),
.sum(sum[7:0]),
.cout(cout0)
);
carry_skip_adder_8bit csa1(
.a(a[15:8]),
.b(b[15:8]),
.cin(cout0),
.sum(sum[15:8]),
.cout(cout1)
);
carry_skip_adder_8bit csa2(
.a(a[23:16]),
.b(b[23:16]),
.cin(cout1),
.sum(sum[23:16]),
.cout(cout2)
);
carry_skip_adder_8bit csa3(
.a(a[31:24]),
.b(b[31:24]),
.cin(cout2),
.sum(sum[31:24]),
.cout(cout)
);
endmodule
