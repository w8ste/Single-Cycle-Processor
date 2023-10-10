module resetff #(parameter WIDTH=8)
                (input logic [WIDTH - 1:0]  d,
		 input logic reset, clk,
		 output logic [WIDTH - 1:0] q);
   
   always_ff @(posedge clk)
     begin
	if(reset) q <= 0;
	else q <= d;
     end
endmodule // resetff
