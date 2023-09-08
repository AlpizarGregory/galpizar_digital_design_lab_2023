module shift_right #(parameter N = 8)(
  input logic [N-1:0] data_in, 
  input logic [3:0] shift_count, 
  output logic [N-1:0] data_out 
);

  always_comb begin
    
    data_out = 0;
    for (int i = N-1; i >= 0; i = i - 1) begin
      if (i < N - shift_count) begin
        
        data_out[i] = data_in[i + shift_count];
      end
    end
  end

endmodule