module top_module #(parameter N = 8, parameter NUM_INSTANCES = 2) (
    input wire [N-1:0] a [0:NUM_INSTANCES-1][0:N-1],
    input wire [N-1:0] b [0:NUM_INSTANCES-1][0:N-1],
    output wire [2*N-1:0] result [0:NUM_INSTANCES-1][0:N-1]
);
    genvar i;
    generate
        for (i = 0; i < NUM_INSTANCES; i = i + 1) begin : instances
            elementwise_multiplication #(N) inst (
                .a(a[i]),
                .b(b[i]),
                .result(result[i])
            );
        end
    endgenerate
endmodule

