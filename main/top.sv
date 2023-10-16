module top(input logic	       clk, rst,
	   output logic MemWrite,
	   output logic [31:0] WriteData, DataAdr);
   logic [31:0] PC, Instr, ReadData;
   arm arm (clk, rst, Instr, ReadData, PC, DataAdr, WriteData, MemWrite);
   instrmem imem (PC, Instr);
   datamem dmem (clk, MemWrite, DataAdr, WriteData, ReadData);
endmodule // top
