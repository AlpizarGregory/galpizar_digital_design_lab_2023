module mod #(parameter N = 4) (
    input [N-1:0] a,
    input [N-1:0] b,
    output [N-1:0] mod_out
);

wire [N-1:0] temp_quotient;
wire [N-1:0] temp_remainder;

divider #(N) div(
    .numerator(a),
    .denominator(b),
    .quotient(temp_quotient),
    .remainder(temp_remainder)
);

assign mod_out = temp_remainder;

endmodule