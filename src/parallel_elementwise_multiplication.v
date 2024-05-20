module parallel_elementwise_multiplication #(parameter N = 8, parameter NUM_INSTANCES = 2) (
    input wire [N*NUM_INSTANCES-1:0] a,
    input wire [N*NUM_INSTANCES-1:0] b,
    output wire [2*N*NUM_INSTANCES-1:0] result
);
    genvar i;
    generate
        for (i = 0; i < NUM_INSTANCES; i = i + 1) begin : instances
            elementwise_multiplication #(N) inst (
                .a(a[(i+1)*N-1 -: N]),
                .b(b[(i+1)*N-1 -: N]),
                .result(result[(i+1)*2*N-1 -: 2*N])
            );
        end
    endgenerate
endmodule
