`timescale 1ns / 1ps

module tb_parallel_elementwise_multiplication_dynamic;

    // Parameters
    parameter N = 8;
    parameter M = 2;

    // Inputs
    reg [N-1:0] a [0:M-1][0:N-1];
    reg [N-1:0] b [0:M-1][0:N-1];

    // Outputs
    wire [2*N-1:0] result [0:M-1][0:N-1];

    // Instantiate the Unit Under Test (UUT)
    parallel_elementwise_multiplication_dynamic #(N, M) uut (
        .a(a),
        .b(b),
        .result(result)
    );

    integer i, j;

    initial begin
        // Initialize inputs
        for (i = 0; i < M; i = i + 1) begin
            for (j = 0; j < N; j = j + 1) begin
                a[i][j] = j + 1 + (i * 10); // Example values: different for each pair
                b[i][j] = (N - j) + (i * 10); // Example values: different for each pair
            end
        end

        // Wait for some time to let the result settle
        #10;

        // Display the results
        $display("Elementwise Multiplication Results:");
        for (i = 0; i < M; i = i + 1) begin
            for (j = 0; j < N; j = j + 1) begin
                $display("a[%0d][%0d] * b[%0d][%0d] = %0d * %0d = %0d",
                         i, j, i, j, a[i][j], b[i][j], result[i][j]);
            end
        end

        $finish;
    end

endmodule