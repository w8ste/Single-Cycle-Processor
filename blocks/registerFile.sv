module registerFile(input logic		we3,
		    input logic [3:0]	ra1, ra2, a3,
		    input logic [31:0]	r15, wd3,
		    input logic		clk,
		    output logic [31:0]	rd1, rd2);
   
   // create 15 32 bit register 
   logic [31:0] register[14:0];

   // if write enable 3 is set, write value at wd3 into 
   // the through a3 specified register   
   always_ff @(posedge clk)
     begin
	if(we3) register[a3] <= wd3;
     end

   // Since r15 is a special case we have to differentiate here
   assign rd1 = (ra1 == 4'b1111) ? r15 : register[ra1];
   assign rd2 = (ra2 == 4'b1111) ? r15 : register[ra2];

endmodule // registerFile
