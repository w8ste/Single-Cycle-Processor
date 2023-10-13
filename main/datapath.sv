    module datapath(input logic	    clk, reset, RegWrite,
		    input logic	    MemToReg, PCSrc, ALUSrc,
		    input logic [1:0]   RegSrc, ImmSrc, ALUControl,
		    input logic [31:0] Instr, ReadData,
		    output logic [3:0]  Flags,
		    output logic [31:0] PC, ALUResult, WriteData);

   logic [31:0] ExtImm, SrcA, SrcB, Result, PCNext, PC4, PC8;
   logic [3:0]	ra1, ra2;

   //programm counter
   multiplexer #(32) PCMux (PCSrc, PC4, Result, PCNext); //determines programm flow 
   resetff #(32) PCff (PCNext, reset, clk, PC);
   adder #(32) AdderPC4 (PC, 32'b100, PC4); //increment pc by four
   adder #(32) AdderPC8 (PC4, 32'b100, PC8); //increment the pc by another 4 to increase it by 8

   //register file
   multiplexer #(4) ra1mux (RegSrc[0], Instr[19:16], 4'b1111, ra1);
   multiplexer #(4) ra2mux (RegSrc[1], Instr[3:0], Instr[15:12], ra2);
   registerFile regFile (RegWrite, ra1, ra2, Instr[15:12], PC8, Result, clk, SrcA, WriteData);

   //SrcB logic 
   extender ext (Instr[23:0], ImmSrc, ExtImm);
   multiplexer #(32) SrcBmux (AlUSrc, WriteData, SrcB);
   
   // AlU Control
   alu alu(SrcA, SrcB, ALUControl, ALUResult, ALUFlags);
   
endmodule // datapath
