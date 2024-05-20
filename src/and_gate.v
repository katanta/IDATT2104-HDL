module and_gate(
    input wire a,
    input wire b,
    output wire c
);
assign c = a & b;
endmodule


// yosys -p "read_verilog float32_multiplication.v; proc; techmap; write_blif float32_multiplication.blif"C