module alu(
	input [31:0]a,
	input [31:0]b,
	input [2:0]op,
	output reg [31:0]res,
	output zF
);

assign zF = (res==32'b0);

parameter NOP=3'b000, 
          ADD=3'b001,
          SUB=3'b010;

endmodule
