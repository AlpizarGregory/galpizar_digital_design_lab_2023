module mod(
    input [3:0] a,
    input [3:0] b,
    output [3:0] mod_out
);

logic [3:0] temp_quotient;
logic [3:0] temp_remainder;

divider div(
    .a(a),
    .b(b),
    .quotient(temp_quotient),
    .remainder(temp_remainder)
);

assign mod_out = temp_remainder;

endmodule