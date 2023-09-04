module n_bit_adder #(
  parameter int N = 4
)(
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  input logic cin,
  output logic [N-1:0] sum,
  output logic cout
);
  logic [N:0] carry;
  
  assign carry[0] = cin;
  
  generate
    genvar i;
    for (i = 0; i < N; i++) begin : adder_gen
      full_adder_1bit adder_inst(
        .a(a[i]),
        .b(b[i]),
        .cin(carry[i]),
        .sum(sum[i]),
        .cout(carry[i+1])
      );
    end
  endgenerate
  
  assign cout = carry[N]; // El acarreo de salida es el acarreo del bit más significativo

endmodule