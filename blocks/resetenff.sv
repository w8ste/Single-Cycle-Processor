module resetenff #(parameter WIDTH=8)
                  (input logic reset, enable, clk,
		   input logic [WIDTH - 1:0] d,
		   output logic [WIDTH - 1:0] q);

   always_ff @(posedge clk, posedge reset)
     begin
	if(reset) q <= 0;
	else if(enable) q <= d;
     end
   
endmodule // resetenff
