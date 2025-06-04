`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 18:21:12
// Design Name: 
// Module Name: tb_carryskipadder_32bit
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


module tb_carryskipadder_32bit;
reg [31:0]a;
reg [31:0]b;
reg cin;
wire [31:0]sum;
wire cout;

carry_skip_adder_32bit uut(
.a(a),
.b(b),
.cin(cin),
.sum(sum),
.cout(cout)
);

initial begin
$display("Time\ta\t\t\tb\t\t\tcin\tsum\t\t\tcout");
$monitor("%0dns\t%h\t%h\t%b\t%h\t%b",$time,a,b,cin,sum,cout);
a = 32'h99999999; b = 32'h0000a444;cin = 0 ; #10;
b =32'h11111111; #10;
a = 32'h000000ff; #10;
$finish;
end 
endmodule


