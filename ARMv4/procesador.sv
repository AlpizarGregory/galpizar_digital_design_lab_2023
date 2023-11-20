
module procesador(input logic clk, rst, clk_vga,  input logic [16:0] vga_addr, output logic [7:0] ram_vga);
	
	logic [31:0] instruction;
	logic [31:0] pc;
	logic [31:0] pcUse;
	logic [31:0] dataRead, dataWrite;
	logic memWrite;
	logic [17:0] addr;
	logic [1:0] select; 
	logic [16:0] out_addr;
	logic [7:0] i1, i2, i3, data_write_noUse, data_read_noUse;
	logic [7:0] result;
	
	initial begin
		
		pc = 0;
		pcUse = 0;
		
	end
	
	pcRegister P0(clk, rst, pc, pcUse);
	InstructionMemory IM(clk,rst, pcUse, instruction);
	cpu CPU(clk, rst, instruction, dataRead, pcUse, pc, dataWrite, memWrite, addr);
	ChipSet CS(addr, select, out_addr);
	mux_3_to_1_32 MUX(i1, i2, i3, select, result);
	RamDataMem DRAM(rst, rst, out_addr,vga_addr,clk,clk_vga,dataWrite[7:0],data_write_noUse,memWrite,1'b0,i1,ram_vga);
	RomDataMem DROM(rst, out_addr, clk, i2);
	
	assign dataRead[7:0] = result;
	assign dataRead[31:8] = 0;
	
endmodule


module pcRegister(input logic clk, rst, input logic [32:0] pcin, output logic [32:0] pcout);

	
	always @ (posedge clk or posedge rst) begin
		
		if (rst) pcout = 0;
		else
		pcout = pcin;
	
	end

endmodule

module InstructionMemory(input clk,rst,
								input [31:0] pc,
								output [31:0] ins);
  
	logic [7:0] rom [4000:0];
	logic [31:0] outaux;
	
	initial $readmemh("C:/Users/Bryan Gomez/Documents/ARMv4/program.mem", rom);
	
	always_ff @(posedge clk or posedge rst) begin
	
		outaux = {rom[pc], rom[pc+1], rom[pc+2], rom[pc+3]};
	
	end

	assign ins = outaux;


endmodule


module cpu(input logic clk, rst, input logic [31:0] instruction, input logic [31:0] dataRead, input logic [31:0] pc,
				output logic [31:0] pcOut, dataWrite, output logic memWrite, 
				output [17:0] addr);
	
	logic [3:0] aluFlags;
	logic pcSrc, regWrite, memtoReg, aluSrc;
	logic [1:0] immSrc, regSrc, aluControl;
	logic [3:0] a1, a2, a3;
	logic [31:0] pc_plus_4;
	logic [31:0] pc_plus_8;
	logic [31:0] rd1, rd2, wd3, r15;
	logic [31:0] extImm, aluResult, srcB, resultPc;
	

	
	ControlUnit C0(clk, rst, instruction[31:28], aluFlags, instruction[15:12],
						instruction[27:26], instruction[25:20], 
						pcSrc, regWrite, memWrite, memtoReg,
						aluSrc, immSrc, regSrc, aluControl);
	
	mux_2_to_1_4 M0(4'd15, instruction[19:16], regSrc[0], a1);
	mux_2_to_1_4 M1(instruction[15:12], instruction[3:0], regSrc[1], a2);
	
	
	plus_n P4(pc, 32'd4, pc_plus_4);
	plus_n P8(pc_plus_4, 32'd4, pc_plus_8);
	
	RegisterFile R0(clk,rst, regWrite, 
               a1, a2, instruction[15:12], 
               resultPc, pc_plus_8,
               rd1, rd2);
	
	Extend E0(instruction[23:0], immSrc, extImm);
	mux_2_to_1_32 M2(extImm, rd2, aluSrc, srcB);
	
	alu A0(rd1, srcB, aluControl, aluResult, aluFlags[1], aluFlags[2], aluFlags[3], aluFlags[0]);
	
	mux_2_to_1_32 M3(dataRead, aluResult, memtoReg, resultPc);
	mux_2_to_1_32 M4(resultPc, pc_plus_4, pcSrc, pcOut);
	
	
	assign addr = aluResult;
	assign dataWrite = rd2;
	

endmodule

module ChipSet (input logic [17:0] addr,output logic [1:0] select,output logic [16:0] out_addr);


	logic [17:0] addr_assign;
	
	always @(*) begin
		
		if(addr >= 0 && addr < 18'd65535) begin
		
			select <= 2'b00;
			addr_assign <= addr;
		
		end else if(addr >= 18'd65535 && addr < 18'd131072) begin
			select <= 2'b01;
			addr_assign <= addr-18'd65535;
		
		end
		
	end

	assign out_addr = addr_assign;
	
endmodule

