module divider (
  input logic [3:0] numerator,
  input logic [3:0] denominator,
  output logic [3:0] quotient,
  output logic [3:0] remainder
);

  wire [67:0] numerator_temp;
  wire [3:0] denominator_temp;
  wire [67:0] quotient_temp;
  wire [15:0] greater;
  wire [15:0] equal;
  wire [15:0] lower;
  wire [15:0] uselessvar;

  assign numerator_temp[0] = numerator[0];
  assign numerator_temp[1] = numerator[1];
  assign numerator_temp[2] = numerator[2];
  assign numerator_temp[3] = numerator[3];
  assign denominator_temp = denominator;
  assign quotient_temp[0] = 1'b0;
  assign quotient_temp[1] = 1'b0;
  assign quotient_temp[2] = 1'b0;
  assign quotient_temp[3] = 1'b0;

  generate
    genvar i;
    for (i = 0; i < 16; i++) begin : loop
      comparator comp_inst(
        .a(numerator_temp[i*4+3:i*4]),
        .b(denominator_temp),
        .aeqb(equal[i]),
        .agtb(greater[i]),
        .altb(lower[i])
      );
      n_bit_subtractor sub_inst(
        .a(numerator_temp[i*4+3:i*4]),
        .b(denominator_temp),
        .doit({greater[i], 3'b000}),
        .res(numerator_temp[(i+1)*4+3:(i+1)*4]),
        .negout(uselessvar)
      );
        
      n_bit_adder add_inst(
        .a(quotient_temp[i*4+3:i*4]),
        .b({greater[i], 3'b000}),
        .cin(1'b0),
        .sum(quotient_temp[(i+1)*4+3:(i+1)*4]),
        .cout(uselessvar[i])
      );

    end
  endgenerate

  assign quotient = quotient_temp[67:64];
  assign remainder = numerator_temp[67:64];

endmodule
