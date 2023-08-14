module cpu();

reg clk = 1'b0;
reg rst = 1'b1;

always begin
	#1 clk = ~clk;
end

wire [7:0]instr_addr = 8'b0;
wire [31:0]instr_out;

wire [7:0]data_addr = 8'b0;
wire [31:0]data_out;

wire [4:0]reg_addr = 5'b0;
wire reg_write = 1'b0;
wire [31:0]reg_in;
wire [31:0]reg_out;

wire [7:0]ram_addr = 8'b0;
wire ram_write = 1'b0;
wire [31:0]ram_in;
wire [31:0]ram_out;

wire [31:0]alu_a; 
wire [31:0]alu_b; 
wire [2:0]alu_op;
wire [31:0]alu_res; 
wire zF;

flash_instr flash_instr(.addr(instr_addr), .out(instr_out));
flash_data flash_data(.addr(data_addr), .out(data_out));
reg_file reg_file(.clk(clk), .write(reg_write), .rst(rst), .addr(reg_addr), .in(reg_in), .out(reg_out));
ram ram(.write(ram_write), .addr(ram_addr), .in(ram_in), .out(ram_out));
alu alu(.a(alu_a), .b(alu_b), .op(alu_op), .res(alu_res), .zF(zF));
control control(.clk(clk), .instr(instr_out), .data(data_out), .regf_in(reg_out), .ram_in(ram_out), .alu_res(alu_res), .alu_a(alu_a), .alu_b(alu_b), .alu_op(alu_op), .regf_out(reg_in), .regf_addr(reg_addr), .regf_write(reg_write), .ram_out(ram_in), .ram_addr(ram_addr), .ram_write(ram_write));

initial begin
	$dumpvars;
	#2 $finish;
end

endmodule
