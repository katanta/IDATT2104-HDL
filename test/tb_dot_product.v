module tb_dot_product;

    // Parameter for vector size
    parameter N = 8;

    // Inputs
    reg [N-1:0] a [0:N-1];
    reg [N-1:0] b [0:N-1];

    // Outputs
    wire [2*N-1:0] result;

    // Instantiate the Unit Under Test (UUT)
    dot_product #(N) uut (
        .a(a),
        .b(b),
        .result(result)
    );

    integer i;

    initial begin
        // Initialize inputs
        for (i = 0; i < N; i = i + 1) begin
            a[i] = i + 1; // a = {1, 2, 3, ..., N}
            b[i] = (N - i); // b = {N, N-1, N-2, ..., 1}
        end

        // Wait for some time to let the result settle
        #10;

        // Display the results
        $display("Dot Product Result:");
        $display("Sum of elementwise products:");
        for (i = 0; i < N; i = i + 1) begin
            $display("a[%0d] * b[%0d] = %0d * %0d = %0d", i, i, a[i], b[i], a[i] * b[i]);
        end
        $display("Dot product = %0d", result);

        // End the simulation
        $finish;
    end

endmodule
