module tb_float_mult;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] result;

    // Instantiate the floating-point multiplication module
    float32_multiplication uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // Test case 1
        a = 32'b00111111100000000000000000000000; // 1.0 in IEEE 754
        b = 32'b01000000000000000000000000000000; // 2.0 in IEEE 754
        #10;

        // Test case 2
        a = 32'b01000000010000000000000000000000; // 3.0 in IEEE 754
        b = 32'b01000000100000000000000000000000; // 4.0 in IEEE 754
        #10;

        // Test case 3
        a = 32'b00111111100000000000000000000000; // 1.0 in IEEE 754
        b = 32'b00111111100000000000000000000000; // 1.0 in IEEE 754
        #10;

        // Test case 4
        a = 32'b11000000000000000000000000000000; // -2.0 in IEEE 754
        b = 32'b01000000000000000000000000000000; // 2.0 in IEEE 754
        #10;

        $finish;
    end

    /*
    Custom float32 format:
    1 bit for the sign: The most significant bit (bit 31) indicates the sign (0 for positive, 1 for negative).
    8 bits for the exponent: Bits 30 to 23 represent the exponent, biased by 127.
    23 bits for the fraction (mantissa): Bits 22 to 0 represent the fraction.
    */

    initial begin
        $monitor("Test: %b * %b = %b", a, b, result);
    end
endmodule
