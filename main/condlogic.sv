module condlogic (input logic	    clk, rst,
		  input logic	    PCS, RegW, MemW,
		  input logic [1:0] FlagW,
		  input logic [3:0] Cond, ALUFlags,
		  output logic	    PCSrc, RegWrite, MemWrite);
   logic CondEx;
   logic [1:0] FlagWrite;
   logic [3:0] Flags;

   // Create Flip Flops 
   resetenff #(2) ff0 (rst, FlagWrite[0], clk, ALUFlags[1:0], Flags[1:0]);
   resetenff #(2) ff1 (rst, FlagWrite[1], clk, ALUFlags[3:2], Flags[3:2]);

   // Write controls 
   condcheck condcheck(Cond, Flags, CondEx); 
   assign PCSrc = PCS & CondEx;
   assign RegWrite = RegW & CondEx;
   assign MemWrite = MemW & CondEx;
   assign FlagWrite = FlagW & {2{CondEx}};

endmodule // condlogic
