module float32_multiplication (input [31:0] a,        // Input float a
                               input [31:0] b,        // Input float b
                               output [31:0] result); // Output float result
    // Separate sign, exponent, and mantissa
    wire sign_a        = a[31];
    wire sign_b        = b[31];
    wire [7:0] exp_a   = a[30:23];
    wire [7:0] exp_b   = b[30:23];
    wire [23:0] mant_a = {1'b1, a[22:0]};
    wire [23:0] mant_b = {1'b1, b[22:0]};
    
    // Calculate sign of the result
    wire sign_res = sign_a ^ sign_b;
    
    // Calculate exponent of the result
    wire [8:0] exp_res = exp_a + exp_b - 8'd127;
    
    // Calculate mantissa of the result
    wire [47:0] mant_res = mant_a * mant_b;
    
    // Normalize the result
    wire [7:0] final_exp   = mant_res[47] ? (exp_res + 8'd1) : exp_res;
    wire [22:0] final_mant = mant_res[47] ? mant_res[46:24] : mant_res[45:23];
    
    // Assemble the result
    assign result = {sign_res, final_exp[7:0], final_mant[22:0]};
endmodule
