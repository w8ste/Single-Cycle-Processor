module controller(input logic clk, rst,
		  input logic [3:0] Cond,
		  input logic [1:0] Op,
		  input logic [5:0] Funct,
		  input logic [3:0] Rd, ALUFlags, 
		  output logic PCSrc, RegWrite, MemWrite, MemToReg, ALUSrc,
		  output logic [1:0] ImmSrc, RegSrc, ALUControl);

   logic PCS, RegW, MemW;
   logic [1:0] FlagW;
   
   decoder dc (Funct, Op, Rd, FlagW, ALUControl, RegSrc, ImmSrc, ALUSrc, MemToReg, MemW, RegW, PCS);
   condlogic cl (clk, rst, PCS, RegW, MemW, FlagW, Cond, ALUFlags, PCSrc, RegWrite, MemWrite);
   
endmodule // controller
