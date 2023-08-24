module countdownNbits
	#(parameter Nbits = 8)
		(input logic clk, reset,input logic [Nbits-1:0] first,
		output logic [Nbits-1:0] current);
	
	
	
	/*
	if (dec[3]) y = 4'b1000;
	else if (a[2]) y = 4'b0100;
	else if (a[1]) y = 4'b0010;
	else if (a[0]) y = 4'b0001;
	else y = 4'b0000;

	*/
	// asynchronous reset
	
	always_ff @(posedge clk, posedge reset)
		if (reset) current <= first;
		//else if (current == 0) current <= 'b0;
		else current <= current - 1;
		
		

	
endmodule