module CheckPos(input logic [9:0] hs,vs,
				output logic [63:0]pos);
		generate
			genvar iter;

			for (iter = 0; iter < 64; iter++) begin : pos_gen
				assign pos[iter] = ((5 + (iter % 8)*5 + (iter % 8)*74 < hs) & (5 + (iter % 8)*5 + ((iter % 8)+1)*74) & (5 + (iter / 8)*5 + (iter / 8)*54 < vs) & (5 + (iter / 8)*5 + ((iter / 8)+1)*54 > vs)) ? 1:0;
				
			end
		endgenerate
			

		//assign pos[0]  = ((5   < hs)&(151 > hs)&(5   < vs)&(110 > vs))? 1:0;
		//assign pos[1]  = ((171 < hs)&(311 > hs)&(5   < vs)&(110 > vs))? 1:0;
		//assign pos[2]  = ((331 < hs)&(471 > hs)&(5   < vs)&(110 > vs))? 1:0;
		//assign pos[3]  = ((491 < hs)&(631 > hs)&(5   < vs)&(110 > vs))? 1:0;
		//assign pos[4]  = ((5   < hs)&(151 > hs)&(130 < vs)&(230 > vs))? 1:0;
		//assign pos[5]  = ((171 < hs)&(311 > hs)&(130 < vs)&(230 > vs))? 1:0;
		//assign pos[6]  = ((331 < hs)&(471 > hs)&(130 < vs)&(230 > vs))? 1:0;
		//assign pos[7]  = ((491 < hs)&(631 > hs)&(130 < vs)&(230 > vs))? 1:0;
		//assign pos[8]  = ((5   < hs)&(151 > hs)&(250 < vs)&(350 > vs))? 1:0;
		//assign pos[9]  = ((171 < hs)&(311 > hs)&(250 < vs)&(350 > vs))? 1:0;
		//assign pos[10] = ((331 < hs)&(471 > hs)&(250 < vs)&(350 > vs))? 1:0;
		//assign pos[11] = ((491 < hs)&(631 > hs)&(250 < vs)&(350 > vs))? 1:0;
		//assign pos[12] = ((5   < hs)&(151 > hs)&(375 < vs)&(475 > vs))? 1:0;
		//assign pos[13] = ((171 < hs)&(311 > hs)&(375 < vs)&(475 > vs))? 1:0;
		//assign pos[14] = ((331 < hs)&(471 > hs)&(375 < vs)&(475 > vs))? 1:0;
		//assign pos[15] = ((491 < hs)&(631 > hs)&(375 < vs)&(475 > vs))? 1:0;
		
endmodule