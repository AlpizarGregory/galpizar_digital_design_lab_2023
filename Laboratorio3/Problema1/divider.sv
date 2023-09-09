module divider (
  input logic [3:0] numerator,
  input logic [3:0] denominator,
  output logic [3:0] quotient,
  output logic [3:0] remainder
);

  wire [3:0] numerator_temp;
  wire [3:0] denominator_temp;
  wire [3:0] quotient_temp;
  reg lower;
  wire greater;
  wire equal;
  wire uselessvar;


  assign numerator_temp = numerator;
  assign denominator_temp = denominator;

  initial begin
    lower = 1'b0;
    greater = 1'b0;
    equal = 1'b0;
  end

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

      if (numerator_temp < denominator_temp) begin

        n_bit_subtractor sub_inst(
          .a(numerator_temp),
          .b(denominator_temp),
          .aorb(1'b1),
          .doit(lower),
          .res(numerator_temp),
          .negout(uselessvar)
        );
        
        n_bit_adder add_inst(
          .a(quotient_temp),
          .b(lower),
          .cin(1'b0),
          .sum(quotient_temp),
          .cout(uselessvar)
        );
    end
  endgenerate

  assign quotient = quotient_temp;

  assign remainder = numerator_temp;

endmodule
