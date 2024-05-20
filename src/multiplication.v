module multiplication(
    input wire [7:0] a, // 8-bit input
    input wire [7:0] b, // 8-bit input
    output wire [15:0] c // 16-bit output
);
assign c = a * b;
endmodule
