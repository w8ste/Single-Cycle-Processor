// multiplexer with two data inputs
module multiplexer #(parameter WIDTH=8)
                    (input logic s,
		    input logic [WIDTH-1: 0] d0, d1,
		    output logic [WIDTH-1: 0] y);

   assign y = s == 1'b0 ? d0 : d1;

endmodule // multiplexer
