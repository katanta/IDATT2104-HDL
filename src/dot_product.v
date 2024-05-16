module dot_product #(parameter SIZE = 4)(
    input wire [8*SIZE-1:0] a, // Flattened input vector a
    input wire [8*SIZE-1:0] b, // Flattened input vector b
    output reg [15:0] result   // Output result
);
    integer i;
    always @(*) begin
        result = 0;
        for (i = 0; i < SIZE; i = i + 1) begin
            result = result + a[8*i +: 8] * b[8*i +: 8];
        end
    end
endmodule
