module CheckPos(input logic [9:0] hs,vs,
				output logic [63:0]pos);


		//Linea 1: de  0  a  5
		//Linea  2 : de  59  a  64
		//Linea  3 : de  118  a  123
		//Linea  4 : de  177  a  182
		//Linea  5 : de  236  a  241
		//Linea  6 : de  295  a  300
		//Linea  7 : de  354  a  359
		//Linea  8 : de  413  a  418
		//Linea  9 : de  472  a  477
		
		//Columna 1: de  0  a  5
		//Columna  2 : de  79  a  84
		//Columna  3 : de  158  a  163
		//Columna  4 : de  237  a  242
		//Columna  5 : de  316  a  321
		//Columna  6 : de  395  a  400
		//Columna  7 : de  474  a  479
		//Columna  8 : de  553  a  558
		//Columna  9 : de  632  a  637


		//generate
		//	genvar iter;
		//
		//	for (iter = 0; iter < 64; iter++) begin : pos_gen
		//		assign pos[iter] = ((5 + (iter % 8)*5 + (iter % 8)*74 < hs) & (5 + (iter % 8)*5 + ((iter % 8)+1)*74) & (5 + (iter / 8)*5 + (iter / 8)*54 < vs) & (5 + (iter / 8)*5 + //((iter / 8)+1)*54 > vs)) ? 1:0;
		//		
		//	end
		//endgenerate


			
		assign pos[0] = ((vs > 5) & (vs < 59) & (hs > 5) & (hs < 79)) ? 1:0;
		assign pos[1] = ((vs > 5) & (vs < 59) & (hs > 84) & (hs < 158)) ? 1:0;
		assign pos[2] = ((vs > 5) & (vs < 59) & (hs > 163) & (hs < 237)) ? 1:0;
		assign pos[3] = ((vs > 5) & (vs < 59) & (hs > 242) & (hs < 316)) ? 1:0;
		assign pos[4] = ((vs > 5) & (vs < 59) & (hs > 321) & (hs < 395)) ? 1:0;
		assign pos[5] = ((vs > 5) & (vs < 59) & (hs > 400) & (hs < 474)) ? 1:0;
		assign pos[6] = ((vs > 5) & (vs < 59) & (hs > 479) & (hs < 553)) ? 1:0;
		assign pos[7] = ((vs > 5) & (vs < 59) & (hs > 558) & (hs < 632)) ? 1:0;
		assign pos[8] = ((vs > 64) & (vs < 118) & (hs > 5) & (hs < 79)) ? 1:0;
		assign pos[9] = ((vs > 64) & (vs < 118) & (hs > 84) & (hs < 158)) ? 1:0;
		assign pos[10] = ((vs > 64) & (vs < 118) & (hs > 163) & (hs < 237)) ? 1:0;
		assign pos[11] = ((vs > 64) & (vs < 118) & (hs > 242) & (hs < 316)) ? 1:0;
		assign pos[12] = ((vs > 64) & (vs < 118) & (hs > 321) & (hs < 395)) ? 1:0;
		assign pos[13] = ((vs > 64) & (vs < 118) & (hs > 400) & (hs < 474)) ? 1:0;
		assign pos[14] = ((vs > 64) & (vs < 118) & (hs > 479) & (hs < 553)) ? 1:0;
		assign pos[15] = ((vs > 64) & (vs < 118) & (hs > 558) & (hs < 632)) ? 1:0;
		assign pos[16] = ((vs > 123) & (vs < 177) & (hs > 5) & (hs < 79)) ? 1:0;
		assign pos[17] = ((vs > 123) & (vs < 177) & (hs > 84) & (hs < 158)) ? 1:0;
		assign pos[18] = ((vs > 123) & (vs < 177) & (hs > 163) & (hs < 237)) ? 1:0;
		assign pos[19] = ((vs > 123) & (vs < 177) & (hs > 242) & (hs < 316)) ? 1:0;
		assign pos[20] = ((vs > 123) & (vs < 177) & (hs > 321) & (hs < 395)) ? 1:0;
		assign pos[21] = ((vs > 123) & (vs < 177) & (hs > 400) & (hs < 474)) ? 1:0;
		assign pos[22] = ((vs > 123) & (vs < 177) & (hs > 479) & (hs < 553)) ? 1:0;
		assign pos[23] = ((vs > 123) & (vs < 177) & (hs > 558) & (hs < 632)) ? 1:0;
		assign pos[24] = ((vs > 182) & (vs < 236) & (hs > 5) & (hs < 79)) ? 1:0;
		assign pos[25] = ((vs > 182) & (vs < 236) & (hs > 84) & (hs < 158)) ? 1:0;
		assign pos[26] = ((vs > 182) & (vs < 236) & (hs > 163) & (hs < 237)) ? 1:0;
		assign pos[27] = ((vs > 182) & (vs < 236) & (hs > 242) & (hs < 316)) ? 1:0;
		assign pos[28] = ((vs > 182) & (vs < 236) & (hs > 321) & (hs < 395)) ? 1:0;
		assign pos[29] = ((vs > 182) & (vs < 236) & (hs > 400) & (hs < 474)) ? 1:0;
		assign pos[30] = ((vs > 182) & (vs < 236) & (hs > 479) & (hs < 553)) ? 1:0;
		assign pos[31] = ((vs > 182) & (vs < 236) & (hs > 558) & (hs < 632)) ? 1:0;
		assign pos[32] = ((vs > 241) & (vs < 295) & (hs > 5) & (hs < 79)) ? 1:0;
		assign pos[33] = ((vs > 241) & (vs < 295) & (hs > 84) & (hs < 158)) ? 1:0;
		assign pos[34] = ((vs > 241) & (vs < 295) & (hs > 163) & (hs < 237)) ? 1:0;
		assign pos[35] = ((vs > 241) & (vs < 295) & (hs > 242) & (hs < 316)) ? 1:0;
		assign pos[36] = ((vs > 241) & (vs < 295) & (hs > 321) & (hs < 395)) ? 1:0;
		assign pos[37] = ((vs > 241) & (vs < 295) & (hs > 400) & (hs < 474)) ? 1:0;
		assign pos[38] = ((vs > 241) & (vs < 295) & (hs > 479) & (hs < 553)) ? 1:0;
		assign pos[39] = ((vs > 241) & (vs < 295) & (hs > 558) & (hs < 632)) ? 1:0;
		assign pos[40] = ((vs > 300) & (vs < 354) & (hs > 5) & (hs < 79)) ? 1:0;
		assign pos[41] = ((vs > 300) & (vs < 354) & (hs > 84) & (hs < 158)) ? 1:0;
		assign pos[42] = ((vs > 300) & (vs < 354) & (hs > 163) & (hs < 237)) ? 1:0;
		assign pos[43] = ((vs > 300) & (vs < 354) & (hs > 242) & (hs < 316)) ? 1:0;
		assign pos[44] = ((vs > 300) & (vs < 354) & (hs > 321) & (hs < 395)) ? 1:0;
		assign pos[45] = ((vs > 300) & (vs < 354) & (hs > 400) & (hs < 474)) ? 1:0;
		assign pos[46] = ((vs > 300) & (vs < 354) & (hs > 479) & (hs < 553)) ? 1:0;
		assign pos[47] = ((vs > 300) & (vs < 354) & (hs > 558) & (hs < 632)) ? 1:0;
		assign pos[48] = ((vs > 359) & (vs < 413) & (hs > 5) & (hs < 79)) ? 1:0;
		assign pos[49] = ((vs > 359) & (vs < 413) & (hs > 84) & (hs < 158)) ? 1:0;
		assign pos[50] = ((vs > 359) & (vs < 413) & (hs > 163) & (hs < 237)) ? 1:0;
		assign pos[51] = ((vs > 359) & (vs < 413) & (hs > 242) & (hs < 316)) ? 1:0;
		assign pos[52] = ((vs > 359) & (vs < 413) & (hs > 321) & (hs < 395)) ? 1:0;
		assign pos[53] = ((vs > 359) & (vs < 413) & (hs > 400) & (hs < 474)) ? 1:0;
		assign pos[54] = ((vs > 359) & (vs < 413) & (hs > 479) & (hs < 553)) ? 1:0;
		assign pos[55] = ((vs > 359) & (vs < 413) & (hs > 558) & (hs < 632)) ? 1:0;
		assign pos[56] = ((vs > 418) & (vs < 472) & (hs > 5) & (hs < 79)) ? 1:0;
		assign pos[57] = ((vs > 418) & (vs < 472) & (hs > 84) & (hs < 158)) ? 1:0;
		assign pos[58] = ((vs > 418) & (vs < 472) & (hs > 163) & (hs < 237)) ? 1:0;
		assign pos[59] = ((vs > 418) & (vs < 472) & (hs > 242) & (hs < 316)) ? 1:0;
		assign pos[60] = ((vs > 418) & (vs < 472) & (hs > 321) & (hs < 395)) ? 1:0;
		assign pos[61] = ((vs > 418) & (vs < 472) & (hs > 400) & (hs < 474)) ? 1:0;
		assign pos[62] = ((vs > 418) & (vs < 472) & (hs > 479) & (hs < 553)) ? 1:0;
		assign pos[63] = ((vs > 418) & (vs < 472) & (hs > 558) & (hs < 632)) ? 1:0;

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