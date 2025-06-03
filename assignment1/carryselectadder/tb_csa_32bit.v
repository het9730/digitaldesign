`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 00:00:55
// Design Name: 
// Module Name: tb_csa_32bit
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


module tb_csa_32bit;
reg [31:0]a,b;
reg cin;
wire cout;
wire [31:0]sum;

csa_32bit uut(
.a(a),
.b(b),
.cin(cin),
.sum(sum),
.cout(cout)
);
initial begin
 $display("Time(ns)\ta\t\t\tb\t\t\tcin\tsum\t\t\tcout");

    a = 32'h99999999; b = 32'h00100000; cin = 0; #10;
    $display("%0dns\t%h\t%h\t%b\t%h\t%b", $time, a, b, cin, sum, cout);

    a = 32'h99999999; b = 32'h00000100; cin = 1; #10;
    $display("%0dns\t%h\t%h\t%b\t%h\t%b", $time, a, b, cin, sum, cout);

    a = 32'h11111111; b = 32'h00000100; cin = 0; #10;
    $display("%0dns\t%h\t%h\t%b\t%h\t%b", $time, a, b, cin, sum, cout);

    a = 32'h11111111; b = 32'h00010000; cin = 1; #10;
    $display("%0dns\t%h\t%h\t%b\t%h\t%b", $time, a, b, cin, sum, cout);
$finish;
end
endmodule
