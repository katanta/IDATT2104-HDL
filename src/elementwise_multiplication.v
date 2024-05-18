module elementwise_multiplication #(parameter N = 8) (
    input wire [N-1:0] a [0:N-1],
    input wire [N-1:0] b [0:N-1],
    output wire [2*N-1:0] result [0:N-1]
);
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : multiply_elements
            assign result[i] = a[i] * b[i];
        end
    endgenerate
endmodule
