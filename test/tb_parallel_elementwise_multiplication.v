module tb_parellel_elementwise_multiplication; parameter N = 8; reg [N-1:0] a [0:N-1]; reg [N-1:0] b [0:N-1]; reg [N-1:0] c [0:N-1]; reg [N-1:0] d [0:N-1]; wire [2*N-1:0] result1 [0:N-1]; wire [2*N-1:0] result2 [0:N-1]; parallel_elementwise_multiplication #(N)
                                                                                                                                                                                                                                                                 uut (.a(a), .b(b), .c(c), .d(d), .result_ab(result1), .result_cd(result2));
    
    integer i;
    
    initial begin
        // Initialize inputs
        for (i = 0; i < N; i = i + 1) begin
            a[i] = i + 1; // a = {1, 2, 3, ..., N}
            b[i] = (N - i); // b = {N, N-1, N-2, ..., 1}
            c[i] = i + 2;
            d[i] = i * 2;
        end
        
        // Wait for some time to let the result settle
        #10;
        
        // Display the results
        $display("Elementwise Multiplication Results #1:");
        for (i = 0; i < N; i = i + 1) begin
            $display("a[%0d] * b[%0d] = %0d * %0d = %0d", i, i, a[i], b[i], result1[i]);
        end
        
        $display("Elementwise Multiplication Results #2:");
        for (i = 0; i < N; i = i + 1) begin
            $display("c[%0d] * d[%0d] = %0d * %0d = %0d", i, i, c[i], d[i], result2[i]);
        end
        
        $finish;
    end
    
endmodule
