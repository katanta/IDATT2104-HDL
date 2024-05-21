module dot_product #(parameter N = 8)
                    (input wire [N-1:0] a [0:N-1],  // Input array 'b' with N elements, each element is N bits wide
                     input wire [N-1:0] b [0:N-1],  // Input array 'b' with N elements, each element is N bits wide
                     output wire [2*N-1:0] result); // Output 'result' which is 2*N bits wide
    
    wire [2*N-1:0] product [0:N-1]; // Intermediate product array
    
    // Generate block to perform element-wise multiplication in parallel
    genvar i;
    generate
    for (i = 0; i < N; i = i + 1) begin : multiply_elements
    assign product[i] = a[i] * b[i];
    end
    endgenerate
    
    // Summing the products (still sequential)
    reg [2*N-1:0] sum;
    integer j;
    always @(*) begin
        sum = 0;
        for (j = 0; j < N; j = j + 1) begin
            sum = sum + product[j];
        end
    end
    
    assign result = sum;
    
endmodule
