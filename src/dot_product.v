module dot_product #(parameter N = 8) (
    input wire [N-1:0] a [0:N-1],
    input wire [N-1:0] b [0:N-1],
    output wire [2*N-1:0] result
);
    reg [2*N-1:0] sum;
    integer i;
    always @(a[0] or a[1] or a[2] or a[3] or a[4] or a[5] or a[6] or a[7] or
        b[0] or b[1] or b[2] or b[3] or b[4] or b[5] or b[6] or b[7]) begin
        sum = 0;
        for (i = 0; i < N; i = i + 1) begin
            sum = sum + a[i] * b[i];
        end
    end
    assign result = sum;
endmodule
