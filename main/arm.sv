module arm (input logic clk, rst,
	    input logic [31:0] Instr, ReadData,
	    output logic [31:0] PC, ALUResult, WriteData,
	    output logic MemWrite);
   logic PCSrc, RegWrite, MemToReg, ALUSrc;
   logic [1:0] ImmSrc, RegSrc, ALUControl;
   logic [3:0] ALUFlags;
 
   controller cl (clk, rst, Instr[31:28], ALUFlags, Instr[27:26], Instr[25:20], Instr[15:12],
		  PCSrc, RegWrite, MemWrite, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUControl);

   datapath dp (clk, rst, RegWrite, MemToReg, PCSrc, ALUSrc, RegSrc, ImmSRc, ALUControl, Instr,   
		ReadData, ALUFlags, PC, ALUResult, WriteData);
   
endmodule // arm

   
