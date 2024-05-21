module float8_multiplication (input [7:0] a,        // Input float a
                              input [7:0] b,        // Input float b
                              output [7:0] result); // Output float result
    // Separate sign, exponent, and mantissa
    wire sign_a       = a[7];
    wire sign_b       = b[7];
    wire [3:0] exp_a  = a[6:4];
    wire [3:0] exp_b  = b[6:4];
    wire [3:0] mant_a = {1'b1, a[3:1]};
    wire [3:0] mant_b = {1'b1, b[3:1]};
    
    // Calculate sign of the result
    wire sign_res = sign_a ^ sign_b;
    
    // Calculate exponent of the result
    wire [4:0] exp_res = exp_a + exp_b - 4'd7;
    
    // Calculate mantissa of the result
    wire [7:0] mant_res = mant_a * mant_b;
    
    // Normalize the result
    wire [3:0] final_exp  = mant_res[7] ? (exp_res + 4'd1) : exp_res;
    wire [2:0] final_mant = mant_res[7] ? mant_res[6:4] : mant_res[5:3];
    
    // Assemble the result
    assign result = {sign_res, final_exp[3:0], final_mant[2:0]};
endmodule
