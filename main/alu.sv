module alu(input logic	       clk, rst,
	   input logic [31:0]  PC, Instr, ReadData,
	   output logic	       MemWrite,
	   output logic [31:0] ALUResult, WriteData);
   logic RegWrite, ALUSrc, MemToReg, PCSrc;
   logic [1:0] RegSrc, ImmSrc, ALUControl;
   logic [3:0] ALUFlags;

   
   controller (clk, reset, Instr[31:12], ALUFlags,
	       RegSrc, RegWrite, ImmSrc,
	       ALUSrc, ALUControl,
	       MemWrite, MemtoReg, PCSrc);
   datapath(clk, reset, RegWrite, MemToReg, PCSrc, ALUSrc,
	    RegSrc, ImmSrc, ALUControl, Instr, ReadData,
	    ALUFlags, PC, ALUResult);

     endmodule // alu
