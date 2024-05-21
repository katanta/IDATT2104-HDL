`include "src/elementwise_multiplication.v"

module parallel_elementwise_multiplication_dynamic #(parameter N = 8, parameter M = 2) (
    // N: Bits in integer
    // M: Number of modules to generate
    //    Corresponds to the number of arrays to be multiplied together (must be even).

    input wire [N-1:0] a [0:M-1][0:N-1],
    input wire [N-1:0] b [0:M-1][0:N-1],
    output wire [2*N-1:0] result [0:M-1][0:N-1]
);

// Linear arrays to hold all inputs and outputs
wire [N-1:0] linear_a [0:M*N-1];
wire [N-1:0] linear_b [0:M*N-1];
wire [2*N-1:0] linear_result [0:M*N-1];

// Function to calculate the linear index
function int calculate_index(input int i, j);
    return (i * N) + j;
endfunction

genvar i, j;

// Assign the multi-dimensional inputs to the linear arrays
generate
    for (i = 0; i < M; i = i + 1) begin : loop_M
        for (j = 0; j < N; j = j + 1) begin : loop_N
            assign linear_a[calculate_index(i, j)] = a[i][j];
            assign linear_b[calculate_index(i, j)] = b[i][j];
            assign result[i][j] = linear_result[calculate_index(i, j)];
        end
    end
endgenerate

// Instantiate elementwise_multiplication modules for each pair of arrays
generate
    for (i = 0; i < M; i = i + 1) begin : instantiate_multiplication
        wire [N-1:0] inst_a [0:N-1];
        wire [N-1:0] inst_b [0:N-1];
        wire [2*N-1:0] inst_result [0:N-1];

        for (j = 0; j < N; j = j + 1) begin : loop_instance
            assign inst_a[j] = linear_a[calculate_index(i, j)];
            assign inst_b[j] = linear_b[calculate_index(i, j)];
            assign linear_result[calculate_index(i, j)] = inst_result[j];
        end

        elementwise_multiplication #(N) inst (
            .a(inst_a),
            .b(inst_b),
            .result(inst_result)
        );
    end
endgenerate

endmodule
