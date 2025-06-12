`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2025 15:08:33
// Design Name: 
// Module Name: tb_arraymultiplier
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


module tb_arraymultiplier;
reg [3:0] a;
reg [3:0] b;
wire [7:0] out;
//instantiate dut
arraymultiplier am(
.a(a),
.b(b),
.out(out)
);
integer i,j;
initial begin 
$display("time\t a\t b\t out");
$monitor("%0dns , %b , %b , %b ",$time ,a,b,out );

for(i=0; i<16 ;i = i + 1)begin
for(j=0; j<16 ;j = j + 1)begin

a = i;
b = j;
#10;
end 
end 
end
endmodule

