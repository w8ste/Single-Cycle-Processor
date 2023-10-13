module decoder (input logic [5:0]  Funct,
		input logic [1:0]  Op,
		input logic [3:0]  Rd,
		output logic [1:0] FlagW, ALUControl, RegSrc, ImmSrc,
		output logic ALUSrc, MemToReg, MemW, RegW, PCS);
   logic Branch, ALUOP;
   logic [9:0] mainControl;

   // main decoder 
   always_comb
     begin
	casex(Op)
	  2'b00: if(Funct[5]) mainControl = 10'b0100100001;
	  else mainControl = 10'b0100000001;
	  2'b01: if(Funct[0]) mainControl = 10'b0101101000;
	  else mainControl = 10'b0010101100;
	  2'b10: mainControl = 10'b1000110010;
	  default: mainControl = 10'bx;
	endcase // casex (Op)
     end
   assign {Branch, RegW, MemW, MemToReg, ALUSrc, ImmSrc, RegSrc, ALUOP} = mainControl;
  
   // ALU Decoder
   always_comb
     begin
	if(ALUOP) begin
	   casex(Funct[4:1])
	     4'b0100: ALUControl = 2'b00; //add
	     4'b0010: ALUControl = 2'b01; //sub
	     4'b0000: ALUControl = 2'b10; //and
	     4'b1100: ALUControl = 2'b11; //or
	     default: ALUControl = 2'bx; //not implemented
	   endcase // casex (Funct[4:1])
	   
	   if(Funct[0]) begin
	      FlagW = 2'b00;
	   end else if(ALUControl == 2'b00 || ALUControl == 2'b01) begin
	      FlagW = 2'b11;
	   end else begin
	      FlagW = 2'b10;
	   end 
        end
	else begin
	   ALUControl = 2'b00;
	   FlagW = 2'b00;
	end
     end // always_comb

   //PC Logic
   assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule // decoder
