module dot_product #(parameter N = 8) ( // Module definition with parameter N, default value 8
    input wire [N-1:0] a [0:N-1],    // Input array 'a' with N elements, each element is N bits wide
    input wire [N-1:0] b [0:N-1],    // Input array 'b' with N elements, each element is N bits wide
    output wire [2*N-1:0] result     // Output 'result' which is 2*N bits wide
);

    reg [2*N-1:0] sum; // Register to store the intermediate sum
    integer i;         // Integer for loop index
    always @(a[0] or a[1] or a[2] or a[3] or a[4] or a[5] or a[6] or a[7] or // Sensitivity list for inputs 'a' and 'b'
        b[0] or b[1] or b[2] or b[3] or b[4] or b[5] or b[6] or b[7]) begin
        sum = 0; // Initialize sum to 0
        for (i = 0; i < N; i = i + 1) begin // Loop to iterate over all elements
            sum = sum + a[i] * b[i]; // Accumulate the product of corresponding elements of 'a' and 'b' into sum
        end
    end
    assign result = sum; // Assign the final sum to the output 'result'
endmodule
