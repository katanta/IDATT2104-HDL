module tb_parallel_elementwise_multiplication;

    // Parameters
    parameter N = 8;
    parameter NUM_INSTANCES = 20;

    // Inputs
    reg [N*NUM_INSTANCES-1:0] a;
    reg [N*NUM_INSTANCES-1:0] b;

    // Outputs
    wire [2*N*NUM_INSTANCES-1:0] result;

    // Instantiate the module under test
    parallel_elementwise_multiplication #(N, NUM_INSTANCES) uut (
        .a(a),
        .b(b),
        .result(result)
    );

    // Test vectors
    initial begin
        // Initialize inputs
        a = 0;
        b = 0;

        // Apply test vectors
        #10 a = {8'h01, 8'h02}; b = {8'h03, 8'h04}; // Test case 1
        #10 a = {8'hFF, 8'hAA}; b = {8'h01, 8'h02}; // Test case 2
        #10 a = {8'h10, 8'h20}; b = {8'h30, 8'h40}; // Test case 3
        #10 a = {8'hAB, 8'hCD}; b = {8'hEF, 8'h12}; // Test case 4

        // Wait for some time to observe the results
        #10
        $finish;
    end

    // Monitor the inputs and outputs
    initial begin
        $monitor("a = %h, b = %h, result = %h", a, b, result);
    end

endmodule

module elementwise_multiplication #(parameter N = 8) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    output wire [2*N-1:0] result
);
    assign result = a * b;
endmodule
