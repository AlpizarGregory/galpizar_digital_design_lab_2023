module shift_left #(parameter N = 8)(
  input logic [N-1:0] data_in, 
  input logic [3:0] shift_count,
  output logic V, 
  output logic [N-1:0] data_out 
);

  always_comb begin
  logic overflow_detected;

    if (shift_count >= N) begin
      // If shift_count is greater than or equal to N, the result is all zeros
      data_out = 0;
      overflow_detected = 1;
    end else begin
      data_out = 0;
      overflow_detected = 0;

      for (int i = 0; i < N; i = i + 1) begin
			if (i >= shift_count) begin
			  
			  data_out[i] = data_in[i - shift_count];
			end
		 end
    end

    // Set the overflow flag based on overflow_detected
    V = overflow_detected;
	end

endmodule
