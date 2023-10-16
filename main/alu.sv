module alu (input logic [31:0] a, b,
	    input logic [1:0] ALUControl,
	    output logic [31:0] ALUResult,
	    output logic [3:0] ALUFlags);

   logic [32:0]	t;
   assign t = a + b;

   always_comb
     begin
	case(ALUControl)
	  2'b00: ALUResult = a + b;
	  2'b01: ALUResult = a - b;
	  2'b10: ALUResult = a & b;
	  default: ALUResult = a | b;
	endcase // case (ALUControl)

	//negative flag
	ALUFlags[3] = ALUResult[31];

	//zero flag
	ALUFlags[2] = ALUResult == 32'b0;

	// setting overflow flag

	if(~ALUControl[1]) begin
	   ALUFlags[0] = 0;
	end else begin
	   ALUFlags[0] = t > 33'h0_FFFF_FFFF;
	end
	// carry flag
	if(~ALUControl[1] & ((a & b) | (ALUControl[0] & (a ^ b)))) begin
            ALUFlags[1] = 1;
        end else begin
            ALUFlags[1] = 0;
        end
     end

endmodule // alu
