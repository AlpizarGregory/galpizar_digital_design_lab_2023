module top_module_Filter(input logic clk, rst,
								input logic [2:0] btn,
								output logic [7:0] q,
								output logic [7:0] address);

logic wren, seconds;
logic [7:0] data, addr_wr, addr_cont;

ram1 mem(address, seconds, data, wren, q);
Counter cont(seconds, rst, 1'b1, addr_cont);
hhclock div(seconds, clk);
write_mem write(btn, wren, addr_wr, data);
mux_21 mux_addr(addr_wr, addr_cont, rst, address);	
							
endmodule
											
											