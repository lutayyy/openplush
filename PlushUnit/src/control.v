module control(
	input clk,
	input [31:0]instr,
	input [31:0]data,
	input [31:0]regf_in,
	input [31:0]ram_in,
	input [31:0]alu_res,
	output reg [31:0]alu_a,
	output reg [31:0]alu_b,
	output reg [2:0]alu_op,
	output reg [31:0]regf_out,
	output reg [4:0]regf_addr,
	output reg regf_write,
	output reg [31:0]ram_out,
	output reg [7:0]ram_addr,
	output reg ram_write
);

parameter NOP=3'b000, 
          ADD=3'b001,
          SUB=3'b010,
          MOV=3'b011,
          JMP=3'b100;
 
 parameter r=2'b11,
           m=2'b00,  
           n=2'b10;
           
parameter ram_tmp=8'b0,
          reg_tmp=5'b0;

always @(posedge clk) begin
	if (instr[2:0] == NOP) alu_op = instr[2:0];
	if (instr[2:0] == ADD) begin
		if ((instr[4:3] == n) && (instr[14:13] == n)) begin
			alu_a <= data[instr[12:5]];
			alu_b <= data[instr[22:15]];
			alu_op <= instr[2:0];
		end
	end
	if (instr[2:0] == MOV) begin
		if (instr[4:3] == n) begin
			alu_op <= NOP;
		end
		else begin
			if ((instr[4:3] == m) && (instr[14:13] == r)) begin
				regf_addr <= instr[19:15];
				regf_write <= 1'b0;
				ram_addr <= instr[12:5];
				ram_write <= 1'b1;
				ram_out <= regf_in;
			end
			if ((instr[4:3] == r) && (instr[14:13] == m)) begin
				ram_addr <= instr[22:15];
				ram_write <= 1'b0;
				regf_addr <= instr[9:5];
				regf_write <= 1'b1;
				regf_out <= ram_in;
			end
		end
	end
end

endmodule
