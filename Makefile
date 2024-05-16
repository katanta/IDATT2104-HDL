VFLAGS = -Wall
VVPFLAGS = -lxt2
SRC_DIR = src
TEST_DIR = test

all: sim

sim: sim_and_gate sim_multiply sim_dot_product

sim_and_gate:
	iverilog $(VFLAGS) -o simv_and_gate $(SRC_DIR)/and_gate.v $(TEST_DIR)/testbench_and_gate.v
	vvp $(VVPFLAGS) simv_and_gate

sim_multiply:
	iverilog $(VFLAGS) -o simv_multiply $(SRC_DIR)/multiply.v $(TEST_DIR)/testbench_multiply.v
	vvp $(VVPFLAGS) simv_multiply

sim_dot_product:
	iverilog $(VFLAGS) -o simv_dot_product $(SRC_DIR)/dot_product.v $(TEST_DIR)/testbench_dot_product.v
	vvp $(VVPFLAGS) simv_dot_product

view_and_gate:
	gtkwave dump_and_gate.vcd &

view_multiply:
	gtkwave dump_multiply.vcd &

view_dot_product:
	gtkwave dump_dot_product.vcd &

clean:
	rm -f simv_and_gate simv_multiply simv_dot_product *.vcd
