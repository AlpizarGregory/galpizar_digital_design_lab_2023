module PintarPantalla(
	input logic reset,win,lose,
	input logic [9:0]hs,vs,
	input logic [15:0][3:0]states,
	output logic [7:0] r,g,b);
	
	//logic [3:0] states[15:0];
	logic [23:0] rgb[15:0];
	logic [15:0]pos;
	
	
	
	assign lines = ((hs < 5) | (hs > 79) & (hs < 84) | (hs > 158) & (hs < 163) | (hs > 237) & (hs < 242) | (hs > 316) & (hs < 321) | (hs > 395) & (hs < 400) | (hs > 474) & (hs < 478) | (hs > 553) & (hs < 558) | (hs > 632) | (vs < 5) | (vs > 59) & (vs < 64) | (vs > 118) & (vs < 123) | (vs > 177) & (vs < 182) | (vs > 236) & (vs < 241) | (vs > 295) & (vs < 300) | (vs > 354) & (vs < 359) | (vs > 413) & (vs < 418) | (vs > 472))? 1:0;
	
	//llamar a la logica para asignar valores
	
	CheckPos check(hs,vs,pos);
					
	//colores space0(states[0],pos[0],rgb[0]);
	//
	//colores space1(states[1],pos[1],rgb[1]);
	//
	//colores space2(states[2],pos[2],rgb[2]);
	//
	//colores space3(states[3],pos[3],rgb[3]);
	//
	//colores space4(states[4],pos[4],rgb[4]);
	//
	//colores space5(states[5],pos[5],rgb[5]);
	//
	//colores space6(states[6],pos[6],rgb[6]);
	//
	//colores space7(states[7],pos[7],rgb[7]);
	//
	//colores space8(states[8],pos[8],rgb[8]);
	//
	//colores space9(states[9],pos[9],rgb[9]);
	//
	//colores space10(states[10],pos[10],rgb[10]);
	//
	//colores space11(states[11],pos[11],rgb[11]);
	//
	//colores space12(states[12],pos[12],rgb[12]);
	//
	//colores space13(states[13],pos[13],rgb[13]);
	//
	//colores space14(states[14],pos[14],rgb[14]);
	//
	//colores space15(states[15],pos[15],rgb[15]);
	
	mux_dibujar mux_dib(lines,rgb[0],rgb[1],rgb[2],rgb[3],rgb[4],rgb[5],rgb[6],rgb[7],rgb[8],rgb[9],rgb[10],rgb[11],
							  rgb[12],rgb[13],rgb[14],rgb[15],pos[0],pos[1],pos[2],pos[3],pos[4],pos[5],
							  pos[6],pos[7],pos[8],pos[9],pos[10],pos[11],pos[12],pos[13],pos[14],pos[15],win,lose,r,g,b);
	
endmodule