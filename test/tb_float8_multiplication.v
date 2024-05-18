module tb_float8_multiplication;
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] result;

    // Instantiate the floating-point multiplication module
    float8_multiplication uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // Test case 1
        a = 8'b00111010; // 0.1015625 in custom float8 format
        b = 8'b01000001; // 0.1328125 in custom float8 format
        #10;

        //

        // Test case 2
        a = 8'b01001001; // 0.1953125 in custom float8 format
        b = 8'b01001110; // 0.234375 in custom float8 format
        #10;

        // Test case 3
        a = 8'b00111001; // 0.09765625 in custom float8 format
        b = 8'b00111100; // 0.109375 in custom float8 format
        #10;

        // Test case 4
        a = 8'b11000010; // -0.0087890625 in custom float8 format
        b = 8'b01000010; // 0.0087890625 in custom float8 format
        #10;

        $finish;
    end

    /*
    Custom float8 format:
    1 bit for the sign: The most significant bit (bit 7) indicates the sign (0 for positive, 1 for negative).
    3 bits for the exponent: Bits 6 to 4 represent the exponent, biased by 7.
    4 bits for the fraction (mantissa): Bits 3 to 0 represent the fraction with an implicit leading 1.
    */

    initial begin
        $monitor("Test: %b * %b = %b", a, b, result);
    end
endmodule