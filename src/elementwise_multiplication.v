module elementwise_multiplication #(parameter N = 8) ( // Module definition with parameter N, default value 8
    input wire [N-1:0] a [0:N-1],    // Input array 'a' with N elements, each element is N bits wide
    input wire [N-1:0] b [0:N-1],    // Input array 'b' with N elements, each element is N bits wide
    output wire [2*N-1:0] result [0:N-1] // Output array 'result' with N elements, each element is 2*N bits wide
);

    genvar i; // Declare 'i' as a generate variable
    generate
        for (i = 0; i < N; i = i + 1) begin : multiply_elements // Loop to generate N instances
            assign result[i] = a[i] * b[i]; // Assign the product of corresponding elements of 'a' and 'b' to 'result'
        end
    endgenerate
endmodule
