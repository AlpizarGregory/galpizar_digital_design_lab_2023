module vga_testbench;

reg clk = 0;
wire Hsync, Vsync;
wire [8:0] R, G, B;

VGA_controller vga_controller(
    .clk(clk),
    .Hsync(Hsync),
    .Vsync(Vsync),
    .R(R),
    .G(G),
    .B(B)
);

always #5 clk = ~clk;

endmodule