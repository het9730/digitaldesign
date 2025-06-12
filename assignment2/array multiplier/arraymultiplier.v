`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2025 00:57:45
// Design Name: 
// Module Name: arraymultiplier
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

module arraymultiplier(
    input  [3:0] a,
    input  [3:0] b,
    output [7:0] out
);

    wire pp[3:0][3:0]; // Partial products
    wire [9:0] c;       // Carry wires
    wire [5:0] sumwire; // Intermediate sum wires
    wire carry6;        // One more carry needed for stage 5

    // Generate partial products
    genvar i, j;
    generate
        for(i = 0; i < 4; i = i + 1) begin : gen_row
            for(j = 0; j < 4; j = j + 1) begin : gen_col
                assign pp[i][j] = a[i] & b[j];
            end
        end
    endgenerate

    assign out[0] = pp[0][0];

    // Row 1
    halfadder ha1(
        .a(pp[0][1]),
        .b(pp[1][0]),
        .sum(out[1]),
        .cout(c[0])
    );

    // Row 2
    halfadder ha2(
        .a(pp[0][2]),
        .b(pp[1][1]),
        .sum(sumwire[0]),
        .cout(c[1])
    );

    fulladder fa1(
        .a(sumwire[0]),
        .b(pp[2][0]),
        .cin(c[0]),
        .sum(out[2]),
        .cout(c[2])
    );

    // Row 3
    halfadder ha3(
        .a(pp[0][3]),
        .b(pp[1][2]),
        .sum(sumwire[1]),
        .cout(c[3])
    );

    fulladder fa2(
        .a(sumwire[1]),
        .b(pp[2][1]),
        .cin(c[1]),
        .sum(sumwire[2]),
        .cout(c[4])
    );

    fulladder fa3(
        .a(sumwire[2]),
        .b(pp[3][0]),
        .cin(c[2]),
        .sum(out[3]),
        .cout(c[5])
    );

    // Row 4
    halfadder ha4(
        .a(pp[1][3]),
        .b(pp[2][2]),
        .sum(sumwire[3]),
        .cout(c[6])
    );

    fulladder fa4(
        .a(sumwire[3]),
        .b(pp[3][1]),
        .cin(c[3]),
        .sum(sumwire[4]),
        .cout(c[7])
    );

    fulladder fa5(
        .a(sumwire[4]),
        .b(c[4]),
        .cin(c[5]),
        .sum(out[4]),
        .cout(c[8])
    );

    // Final row
    fulladder fa6(
        .a(pp[2][3]),
        .b(pp[3][2]),
        .cin(c[6]),
        .sum(sumwire[5]),
        .cout(c[9])
    );

    fulladder fa7(
        .a(sumwire[5]),
        .b(c[7]),
        .cin(c[8]),
        .sum(out[5]),
        .cout(carry6)
    );

    fulladder fa8(
        .a(pp[3][3]),
        .b(c[9]),
        .cin(carry6),
        .sum(out[6]),
        .cout(out[7])
    );

endmodule

// Half Adder Module
module halfadder(
    input a, b,
    output sum, cout
);
    assign sum  = a ^ b;
    assign cout = a & b;
endmodule

// Full Adder Module
module fulladder(
    input a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule

