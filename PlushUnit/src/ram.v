module ram(
	input write,
	input [7:0]addr,
	input [31:0]in,
	output [31:0]out
);
reg [31:0] ram[0:255];

assign out = (!write)? ram[addr]:32'b0;

always @(posedge write) begin
	ram[addr] <= in;
end

endmodule
