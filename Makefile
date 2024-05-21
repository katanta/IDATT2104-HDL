VFLAGS = -g2012
SRC_DIR = src
TEST_DIR = test

all: sim

sim: sim_and_gate sim_multiplication sim_dot_product sim_elementwise_multiplication sim_float8_multiplication sim_float16_multiplication sim_float32_multiplication sim_parallel_elementwise_multiplication sim_parallel_elementwise_multiplication_dynamic

sim_float: sim_float8_multiplication sim_float16_multiplication sim_float32_multiplication

sim_and_gate:
	@echo *****SIMULERER AND-GATE*****
	iverilog $(VFLAGS) -o simv_and_gate $(SRC_DIR)/and_gate.v $(TEST_DIR)/tb_and_gate.v
	vvp $(VVPFLAGS) simv_and_gate

sim_multiplication:
	@echo *****SIMULERER VANLIG MULTIPLIKASJON*****
	iverilog $(VFLAGS) -o simv_multiplication $(SRC_DIR)/multiplication.v $(TEST_DIR)/tb_multiplication.v
	vvp $(VVPFLAGS) simv_multiplication

sim_dot_product:
	@echo *****SIMULERER DOT PRODUKT******
	iverilog $(VFLAGS) -o simv_dot_product $(SRC_DIR)/dot_product.v $(TEST_DIR)/tb_dot_product.v
	vvp $(VVPFLAGS) simv_dot_product

sim_elementwise_multiplication:
	@echo *****SIMULERER ELEMENTVIS SEKVENSIELL MULTIPLIKASJON*****
	iverilog $(VFLAGS) -o simv_elementwise_multiplication $(SRC_DIR)/elementwise_multiplication.v $(TEST_DIR)/tb_elementwise_multiplication.v
	vvp $(VVPFLAGS) simv_elementwise_multiplication

sim_float8_multiplication:
	@echo *****SIMULERER FLOAT8 MULTIPLIKASJON*****
	iverilog $(VFLAGS) -o simv_float8_multiplication $(SRC_DIR)/float8_multiplication.v $(TEST_DIR)/tb_float8_multiplication.v
	vvp $(VVPFLAGS) simv_float8_multiplication

sim_float16_multiplication:
	@echo *****SIMULERER FLOAT16 MULTIPLIKASJON*****
	iverilog $(VFLAGS) -o simv_float16_multiplication $(SRC_DIR)/float16_multiplication.v $(TEST_DIR)/tb_float16_multiplication.v
	vvp $(VVPFLAGS) simv_float16_multiplication

sim_float32_multiplication:
	@echo *****SIMULERER FLOAT32 MULTIPLIKASJON*****
	iverilog $(VFLAGS) -o simv_float32_multiplication $(SRC_DIR)/float32_multiplication.v $(TEST_DIR)/tb_float32_multiplication.v
	vvp $(VVPFLAGS) simv_float32_multiplication

sim_parallel_elementwise_multiplication:
	@echo *****SIMULERER ELEMENTVIS PARALELL MULTIPLIKASJON*****
	iverilog $(VFLAGS) -o simv_parallel_elementwise_multiplication $(SRC_DIR)/parallel_elementwise_multiplication.v $(TEST_DIR)/tb_parallel_elementwise_multiplication.v
	vvp $(VVPFLAGS) simv_parallel_elementwise_multiplication

sim_parallel_elementwise_multiplication_dynamic:
	@echo *****SIMULERER ELEMENTVIS PARALELL MULTIPLIKASJON*****
	iverilog $(VFLAGS) -o simv_parallel_elementwise_multiplication_dynamic $(SRC_DIR)/parallel_elementwise_multiplication_dynamic.v $(TEST_DIR)/tb_parallel_elementwise_multiplication_dynamic.v
	vvp $(VVPFLAGS) simv_parallel_elementwise_multiplication_dynamic

view_and_gate:
	gtkwave dump_and_gate.vcd &

view_multiply:
	gtkwave dump_multiply.vcd &

view_dot_product:
	gtkwave dump_dot_product.vcd &

clean:
	rm -f *smv xt2 *.vcd simv*
