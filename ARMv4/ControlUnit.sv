
module ControlUnit(input logic clk, rst, input logic [3:0] cond, aluFlags, rd,
						input logic [1:0] op, input logic [5:0] funct, 
						output logic pcSrc, regWrite, memWrite, memtoReg,
						aluSrc, output logic [1:0] immSrc, regSrc, aluControl);
	
	logic [1:0] flagW;
	logic pcs, regW, memW;
	
	Decoder D0(op, funct, rd, 
					flagW, immSrc, regSrc, aluControl, pcs, regW, memW, memtoReg,
					aluSrc);
	ConditionLogic C1(cond, aluFlags, flagW, 
						pcs, regW, memW, clk, rst, pcSrc, regWrite, memWrite);


endmodule


module Decoder(input logic [1:0] op, input logic [5:0] funct, input logic [3:0] Rd, 
					output logic [1:0] flagW, immSrc, regSrc, aluControl, output logic pcs, regW, memW, memtoReg,
					aluSrc);
	
	logic branch, aluOp;	
	MainDecoder M0(op, funct[5], funct[0], 
					branch, memtoReg, memW, aluSrc, regW, aluOp,
					immSrc,  regSrc);
	
	PCLogic L0(Rd, branch, regW, pcs);
	AluDecoder A0(aluOp, funct[0], funct[4:1], aluControl, flagW);
	


endmodule


module MainDecoder(input logic [1:0] op, input logic func5, func0, 
					output logic branch, memtoReg, memW, aluSrc, regW, aluOp,
					output logic [1:0] immSrc,  regSrc);
	
	assign branch = (op == 2'b10);
	assign memtoReg = (op == 2'b01) & (func0 == 1'b1);
	assign memW = (op == 2'b01) & (func0 == 1'b0);
	assign aluSrc = !((op == 00) & (func5 == 1'b0));
	assign immSrc[1] = 0;
	assign immSrc[0] = (op == 2'b10)|(op == 2'b01);
	assign regW = !( ((op == 2'b01)&(func0 == 0)) | (op == 2'b10) );
	assign regSrc[1] = ((op == 2'b01)&(func0 == 0));
	assign regSrc[0] = (op == 2'b10);
	assign aluOp = (op == 2'b00)|(op == 2'b10);

endmodule



module ConditionLogic(input logic [3:0] cond, aluFlags, input logic [1:0] flagW, 
						input logic pcs, regW, memW, clk, rst, output logic pcSrc, regWrite, memWrite);

	logic condEx;
	logic[3:0] aluFlagsAux;
	logic[1:0] flagWrite;
	
	ConditionCheck H0(cond, aluFlagsAux[3:2], aluFlagsAux[1:0], condEx);
	
	
	always @ (negedge clk) begin
		
		if (flagWrite[1] == 1) begin
			aluFlagsAux[3:2] = aluFlags[3:2];
		end
		
		if (flagWrite[0] == 1) begin
			aluFlagsAux[1:0] = aluFlags[1:0];
		end
		
	end
	
	
	
	assign pcSrc = condEx & pcs;
	assign regWrite = condEx & regW;
	assign memWrite = condEx & memW;
	assign flagWrite = {condEx & flagW[1], condEx & flagW[0]};

endmodule



module PCLogic(input logic [3:0] Rd, input logic branch, regW, output logic pcs);

	assign pcs = ((Rd == 15)&(regW))| branch;

endmodule 



module plus_n #(parameter N=32)(input [N-1:0] i, input [N-1:0] n, output [N-1:0] result);
	
	assign result = i + n; 

endmodule


module RegisterFile(input  logic clk,rst,we3, 
               input  logic [3:0]  ra1, ra2, ra3, 
               input  logic [31:0] wd3, r15,
               output logic [31:0] rd1, rd2);

	logic [14:0][31:0] rf;
	
	
		
	
	always_ff @(negedge clk or posedge rst) begin
	
	
		if(rst) begin
			/*
			rf[0] = 65535;
			*/
			rf[0] = 0;
			rf[1] = 1;
			rf[14:2] = 32'd0;
		end
		else begin
			if (we3) rf[ra3] <= wd3;
		end
	end



	assign rd1 = (ra1 == 4'b1111) ? r15 : rf[ra1];
	assign rd2 = (ra2 == 4'b1111) ? r15 : rf[ra2];
  
  

endmodule


module Extend(input logic [23:0] immediate, input logic [1:0] immSrc, output logic [31:0] extImm);

	always_comb begin
	
		case (immSrc) 
		
			2'b00: begin
				extImm[31:8] = 24'd0;
				extImm[7:0] = immediate[7:0];
			end
			2'b01: begin
				extImm[31:12] = 20'd0;
				extImm[11:0] = immediate[11:0];
			end
			2'b10: begin
				extImm[31:24] = 8'd0;
				extImm[23:0] = immediate[23:0];
			end
			default: begin
				extImm[31:8] = 24'd0;
				extImm[7:0] = immediate[7:0];
			end
		endcase
	
	end

endmodule


module ConditionCheck(input logic [3:0] cond, input logic [1:0] flags32, flags10, 
								output logic condEX);
	
	
	always_comb begin
	
		case (cond)
			4'b000:
				condEX = flags32[0];
			4'b0001:
				condEX = !flags32[0];
			4'b0010:
				condEX = flags10[1];
			4'b0011:
				condEX = !flags10[1];
			4'b0100:
				condEX = flags32[1];
			4'b0101:
				condEX = !flags32[1];
			4'b0110:
				condEX = flags10[0];
			4'b0111:
				condEX = !flags10[0];
			4'b1000:
				condEX = (!flags32[1])&(flags10[1]);
			4'b1001:
				condEX = (!flags32[1])|(flags10[1]);
			4'b1010:
				condEX = !(flags32[1]^flags10[0]);
			4'b1011:
				condEX = (flags32[1]^flags10[0]);
			4'b1100:
				condEX = (!flags32[0])&(!(flags32[1]^flags10[0]));
			4'b1101:
				condEX = (flags32[0])|((flags32[1]^flags10[0]));
			4'b1110:
				condEX = 1;
			default:
				condEX = 1;
			
		endcase
	end

endmodule