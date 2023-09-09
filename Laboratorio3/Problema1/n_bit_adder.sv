module n_bit_adder (
  input logic [3:0] a,
  input logic [3:0] b,
  input logic cin,
  output logic [3:0] sum,
  output logic cout
);
  logic [4:0] carry;
  
  assign carry[0] = cin;
  
  generate
    genvar i;
    for (i = 0; i < 4; i++) begin : adder_gen
      full_adder_1bit adder_inst(
        .a(a[i]),
        .b(b[i]),
        .cin(carry[i]),
        .sum(sum[i]),
        .cout(carry[i+1])
      );
    end
  endgenerate
  
  assign cout = carry[4]; // El acarreo de salida es el acarreo del bit más significativo

endmodule