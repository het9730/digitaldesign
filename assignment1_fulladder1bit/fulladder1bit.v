module fulladder1bit_structural(a, b, cin, sum, cout);
  input a, b, cin;
  output sum, cout;

  wire w1, w2, w3, w4, w5;

  xor (w1, a, b);
  xor (sum, w1, cin);
  and (w2, a, b);
  and (w3, b, cin);
  and (w4, a, cin);
  or  (w5, w2, w3);
  or  (cout, w5, w4);
endmodule

module fulladder1bit_dataflow(a, b, cin, sum, cout);
  input a, b, cin;
  output sum, cout;

  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module fulladder1bit_behavioral(a, b, cin, sum, cout);
  input a, b, cin;
  output reg sum, cout;

  always @ (a or b or cin) begin
    {cout, sum} = a + b + cin;
  end
endmodule



