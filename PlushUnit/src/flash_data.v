module flash_data(
	input write,
	input [7:0]addr,
	input [31:0]in,
	output [31:0]out
);
reg [31:0] memory[0:255];

initial begin
	$readmemb("boot_data", memory);
end

assign out = (!write)? memory[addr]:32'b0;

always @(posedge write) begin
	memory[addr] <= in;
end

endmodule
