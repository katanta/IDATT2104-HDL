module tb_float16_multiplication;
    reg  [15:0] a;
    reg  [15:0] b;
    wire [15:0] result;
    float16_multiplication uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // Test case 1
        a = 16'b0011110000000000;  // 1.0 in IEEE 754 half-precision
        b = 16'b0100000000000000;  // 2.0 in IEEE 754 half-precision
        #10;

        // Test case 2
        a = 16'b0100001000000000;  // 3.0 in IEEE 754 half-precision
        b = 16'b0100010000000000;  // 4.0 in IEEE 754 half-precision
        #10;

        // Test case 3
        a = 16'b0011110000000000;  // 1.0 in IEEE 754 half-precision
        b = 16'b0011110000000000;  // 1.0 in IEEE 754 half-precision
        #10;

        // Test case 4
        a = 16'b1100000000000000;  // -2.0 in IEEE 754 half-precision
        b = 16'b0100000000000000;  // 2.0 in IEEE 754 half-precision
        #10;

        $finish;
    end

    /*
     IEEE 754 half-precision (float16) format:
     1 bit for the sign: The most significant bit (bit 15) indicates the sign (0 for positive, 1 for negative).
     5 bits for the exponent: Bits 14 to 10 represent the exponent, biased by 15.
     10 bits for the fraction (mantissa): Bits 9 to 0 represent the fraction.
     */

    initial begin
        $display("Float16 Multiplication Results:");
        $monitor("Test: %b * %b = %b", a, b, result);
    end
endmodule
