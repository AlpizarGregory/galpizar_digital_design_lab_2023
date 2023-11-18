module VGA_mm
(

	input logic clk,
	//input logic rst,
	//input logic win,lose,
	//input logic [63:0][3:0] cell_matrix,
	//input logic [3:0] state1,
	output logic vga_hsync,vga_vsync,sync_blank,sync_n,
	output logic [7:0]red,green,blue,
	output logic clk_25
);


	logic [9:0]hs;
	logic [9:0]vs;
	
	clock_divider clk_div(clk,clk_25);
			
	ControladorGrafico cgr(clk_25,vga_hsync,vga_vsync,sync_blank,sync_b,hs,vs);


endmodule