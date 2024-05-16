module testbench_dot_product;
    parameter SIZE = 4;
    reg [8*SIZE-1:0] a, b;
    wire [15:0] result;

    // Instantiate the Unit Under Test (UUT)
    dot_product #(SIZE) uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // Initialize input vectors
        a = {8'b00000100, 8'b00000011, 8'b00000010, 8'b00000001}; // {4, 3, 2, 1}
        b = {8'b00001000, 8'b00000111, 8'b00000110, 8'b00000101}; // {8, 7, 6, 5}

        #10;
        $display("Dot product: %d", result); // Expected output: 1*5 + 2*6 + 3*7 + 4*8 = 70

        $finish;
    end

    initial begin
        $dumpfile("dump_dot_product.vcd"); // Name of the VCD file
        $dumpvars(0, testbench_dot_product); // Dump all variables in this module
    end
endmodule
