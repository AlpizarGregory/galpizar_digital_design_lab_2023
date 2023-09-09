module divider (
  input logic [3:0] numerator,
  input logic [3:0] denominator,
  output logic [3:0] quotient,
  output logic [3:0] remainder
);

  wire [3:0] numerator_temp;
  wire [3:0] denominator_temp;
  wire [3:0] quotient_temp;
  wire lower;
  wire greater;
  wire equal;
  wire uselessneg;

  generate
    genvar i;
    for (i = 0; i < 64; i++) begin : loop
      comparator comp_inst(
        .a(numerator_temp),
        .b(denominator_temp),
        .aeqb(equal),
        .agtb(greater),
        .altb(lower)
      );

      if (lower) begin
        break;
      end

      n_bit_subtractor sub_inst(
        .a(numerator_temp),
        .b(denominator_temp),
        .aorb(1'b1),
        .res(numerator_temp),
        .negout(uselessneg)
      );

    end
  endgenerate

  assign quotient_temp = i;

  assign quotient = quotient_temp;

  assign remainder = numerator_temp;

endmodule
