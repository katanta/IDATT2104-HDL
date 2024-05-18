module float16_multiplication (
    input [15:0] a, // Input float a
    input [15:0] b, // Input float b
    output [15:0] result // Output float result
);
    // Separate sign, exponent, and mantissa
    wire sign_a = a[15];
    wire sign_b = b[15];
    wire [4:0] exp_a = a[14:10];
    wire [4:0] exp_b = b[14:10];
    wire [10:0] mant_a = {1'b1, a[9:0]};
    wire [10:0] mant_b = {1'b1, b[9:0]};

    // Calculate sign of the result
    wire sign_res = sign_a ^ sign_b;

    // Calculate exponent of the result
    wire [5:0] exp_res = exp_a + exp_b - 5'd15;

    // Calculate mantissa of the result
    wire [21:0] mant_res = mant_a * mant_b;

    // Normalize the result
    wire [4:0] final_exp = mant_res[21] ? (exp_res + 5'd1) : exp_res;
    wire [9:0] final_mant = mant_res[21] ? mant_res[20:11] : mant_res[19:10];

    // Assemble the result
    assign result = {sign_res, final_exp[4:0], final_mant[9:0]};
endmodule
