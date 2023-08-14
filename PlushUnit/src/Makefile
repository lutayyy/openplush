VC = iverilog
VFLAGS = -o cpu

all: flash_instr.v flash_data.v regf.v ram.v alu.v control.v cpu.v
	$(VC) $(VFLAGS) flash_instr.v flash_data.v regf.v ram.v alu.v control.v cpu.v
