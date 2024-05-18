VFLAGS = -Wall -g2005-sv
VVPFLAGS = -lxt2
SRC_DIR = src
TEST_DIR = test

all: sim

sim: sim_and_gate sim_multiply sim_dot_product sim_elementwise_multiplication

sim_and_gate:
	iverilog $(VFLAGS) -o simv_and_gate $(SRC_DIR)/and_gate.v $(TEST_DIR)/tb_and_gate.v
	vvp $(VVPFLAGS) simv_and_gate

sim_multiply:
	iverilog $(VFLAGS) -o simv_multiply $(SRC_DIR)/multiply.v $(TEST_DIR)/tb_multiply.v
	vvp $(VVPFLAGS) simv_multiply

sim_dot_product:
	iverilog $(VFLAGS) -o simv_dot_product $(SRC_DIR)/dot_product.v $(TEST_DIR)/tb_dot_product.v
	vvp $(VVPFLAGS) simv_dot_product

sim_elementwise_multiplication:
	iverilog $(VFLAGS) -o simv_elementwise_multiplication $(SRC_DIR)/elementwise_multiplication.v $(TEST_DIR)/tb_elementwise_multiplication.v
	vvp $(VVPFLAGS) simv_elementwise_multiplication

view_and_gate:
	gtkwave dump_and_gate.vcd &

view_multiply:
	gtkwave dump_multiply.vcd &

view_dot_product:
	gtkwave dump_dot_product.vcd &

clean:
	rm -f simv_and_gate simv_multiply simv_dot_product simv_elementwise_multiplication *.vcd
