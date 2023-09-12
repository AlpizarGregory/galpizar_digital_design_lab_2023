/*module SubtractionCounter #(parameter N = 4)(
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  output logic [N-1:0] result,
  output logic [N-1:0] count
);
  logic [N-1:0] temp_a;
  logic [N-1:0] temp_b;
  logic [N-1:0] temp_result;
  logic borrow;

  always_comb begin
    temp_a = a;
    temp_b = b;
    result = '0;
    count = '0;
    while (temp_a >= temp_b) begin
      // Initialize borrow to 0 for subtraction
      borrow = 0;
      for (int i = N - 1; i >= 0; i = i - 1) begin
        temp_result[i] = temp_a[i] ^ temp_b[i] ^ borrow;
        borrow = (temp_b[i] & borrow) | ((~temp_a[i]) & (temp_b[i] ^ borrow));
      end

      temp_a = temp_result;
      count = count + 1;
    end
    result = temp_a;
  end
endmodule
*/







module divider #(parameter N = 4) (
  input logic [N-1:0] numerator,
  input logic [N-1:0] denominator,
  output logic [N-1:0] quotient,
  output logic [N-1:0] remainder
);

  wire [N*(2**N+1)-1:0] numerator_temp;
  wire [N-1:0] denominator_temp;
  wire [N*(2**N+1)-1:0] quotient_temp;
  wire [N**2-1:0] greater;
  wire [N**2-1:0] equal;
  wire [N**2-1:0] lower;
  wire [(N**2)*2-1:0] uselessvar;

  wire [N-2:0] zeros;

  /*
  assign numerator_temp[0] = numerator[0];
  assign numerator_temp[1] = numerator[1];
  assign numerator_temp[2] = numerator[2];
  assign numerator_temp[3] = numerator[3];
  
  assign quotient_temp[0] = 1'b0;
  assign quotient_temp[1] = 1'b0;
  assign quotient_temp[2] = 1'b0;
  assign quotient_temp[3] = 1'b0; */

  assign denominator_temp = denominator;
  assign zeros = 0;

  generate
    genvar i;

    for (i = 0; i < N; i++) begin : assignation_loop
      assign numerator_temp[i] = numerator[i];
      assign quotient_temp[i] = 1'b0;
    end

    for (i = 0; i < N**2; i++) begin : division_loop
      comparator #(N) comp_inst(
        .a(numerator_temp[i*N+(N-1):i*N]),
        .b(denominator_temp),
        .aeqb(equal[i]),
        .agtb(greater[i]),
        .altb(lower[i])
      );
      n_bit_subtractor #(N) sub_inst(
        .a(numerator_temp[i*N+(N-1):i*N]),
        .b(denominator_temp),
        .doit(!lower[i]),
        .res(numerator_temp[(i+1)*N+(N-1):(i+1)*N]),
        .negout(uselessvar[i])
      );
        
      n_bit_adder #(N) add_inst(
        .a(quotient_temp[i*N+(N-1):i*N]),
        .b({!lower[i], zeros}),
        .cin(1'b0),
        .sum(quotient_temp[(i+1)*N+(N-1):(i+1)*N]),
        .cout(uselessvar[i+N**2])
      );

    end
  endgenerate

  assign quotient = quotient_temp[N*(2**N+1)-1:N*(2**N)];
  assign remainder = numerator_temp[N*(2**N+1)-1:N*(2**N)];

endmodule
