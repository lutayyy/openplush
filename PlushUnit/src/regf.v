module reg_file(
	input clk, write, rst,
	input [4:0]addr,
	input [31:0]in,
	output reg [31:0]out
);

reg [31:0]r[31:0];

always @(posedge clk or negedge rst) begin
	if (!rst) out <= 32'd0;
	else begin
		if(!write) out <= r[addr];
		else r[addr] <= in;
	end
end
endmodule
