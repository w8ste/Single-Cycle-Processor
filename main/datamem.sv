    module datamem (input logic clk, WE,
		input logic [31:0] A, WD,
		output logic [31:0] rd);
   logic [31:0] ram [63:0];

   assign rd = ram[A[31:2]];

   always_ff @(posedge clk)
     begin
	if(WE) ram[A[31:2]] <= WD;
     end
endmodule // datamem
