module PintarPantalla(
	input logic reset,win,lose,
	input logic [9:0]hs,vs,
	input logic [63:0][3:0]states,
	input logic [3:0] state,
	output logic [7:0] r,g,b);
	
	logic [23:0] rgb[63:0];
	logic [63:0]pos;
	
	
	// Dibuja las líneas de la cuadrícula
	assign lines = ((hs < 5) | 
	(hs > 79) & (hs < 84) | 
	(hs > 158) & (hs < 163) | 
	(hs > 237) & (hs < 242) | 
	(hs > 316) & (hs < 321) | 
	(hs > 395) & (hs < 400) | 
	(hs > 474) & (hs < 478) | 
	(hs > 553) & (hs < 558) | 
	(hs > 632) | 
	(vs < 5) | 
	(vs > 59) & (vs < 64) | 
	(vs > 118) & (vs < 123) | 
	(vs > 177) & (vs < 182) | 
	(vs > 236) & (vs < 241) | 
	(vs > 295) & (vs < 300) | 
	(vs > 354) & (vs < 359) | 
	(vs > 413) & (vs < 418) | 
	(vs > 472))? 1:0;
	
	// pinta los cuadros
	
	CheckPos check(hs,vs,pos);
	
	generate
		genvar i;

		for(i=0;i<64;i++) begin : cuadros
			colores cuadro(state,pos[i],rgb[i]);
		end

	endgenerate
	
	mux_dibujar mux_dib(lines,rgb[0],rgb[1],rgb[2],rgb[3],rgb[4],rgb[5],rgb[6],rgb[7],rgb[8],rgb[9],rgb[10],rgb[11],rgb[12],rgb[13],rgb[14],rgb[15],rgb[16],rgb[17],rgb[18],rgb[19],rgb[20],rgb[21],rgb[22],rgb[23],rgb[24],rgb[25],rgb[26],rgb[27],rgb[28],rgb[29],rgb[30],rgb[31],rgb[32],rgb[33],rgb[34],rgb[35],rgb[36],rgb[37],rgb[38],rgb[39],rgb[40],rgb[41],rgb[42],rgb[43],rgb[44],rgb[45],rgb[46],rgb[47],rgb[48],rgb[49],rgb[50],rgb[51],rgb[52],rgb[35],rgb[54],rgb[55],rgb[56],rgb[57],rgb[58],rgb[59],rgb[60],rgb[61],rgb[62],rgb[63],pos[0],pos[1],pos[2],pos[3],pos[4],pos[5],pos[6],pos[7],pos[8],pos[9],pos[10],pos[11],pos[12],pos[13],pos[14],pos[15],pos[16],pos[17],pos[18],pos[19],pos[20],pos[21],pos[22],pos[23],pos[24],pos[25],pos[26],pos[27],pos[28],pos[29],pos[30],pos[31],pos[32],pos[33],pos[34],pos[35],pos[36],pos[37],pos[38],pos[39],pos[40],pos[41],pos[42],pos[43],pos[44],pos[45],pos[46],pos[47],pos[48],pos[49],pos[50],pos[51],pos[52],pos[53],pos[54],pos[55],pos[56],pos[57],pos[58],pos[59],pos[60],pos[61],pos[62],pos[63],win,lose,r,g,b);
	
endmodule