module extender(input logic [23:0] instr,
		input logic [1:0] immsrc,
		output logic [31:0] extimm);
   always_comb
     case(immsrc)
       //immsrc = 00: 24 x 0 instr
       2'b00: extimm = {24'b0, instr[7:0]};
       //immsrc = 01: 20 x 0 instr
       2'b01: extimm = {20'b0, instr[11:0]};
       //immsrc = 10: 6 x instr_23 instr
       2'b10: extimm = {{6{instr[23]}}, instr[23:0], 2'b00};
       default: extimm = 32'bx;
     endcase
endmodule // extender

   
