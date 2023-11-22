module VGA_mm
(

	input logic clk,
	output logic vga_hsync,vga_vsync,sync_blank,sync_n,
	output logic [7:0]red,green,blue,
	output logic clk_25
);


	logic [9:0]hs;
	logic [9:0]vs;
	
	clock_divider clk_div(clk,clk_25);
			
	ControladorGrafico cgr(clk_25,vga_hsync,vga_vsync,sync_blank,sync_b,hs,vs);


endmodule