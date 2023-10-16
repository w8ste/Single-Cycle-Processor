module instrmem(input logic [31:0] A,
		output logic [31:0] RD);

   logic [31:0] ram [63:0];

   initial
     $readmemh("memfile.dat",ram);
   assign RD = ram[A[31:2]];

endmodule // instrmem
