module testbench_multiply;
    reg [7:0] a, b;
    wire [15:0] c;

    // Instantiate the Unit Under Test (UUT)
    multiply uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Initialize inputs
        a = 8'b00000011; // 3
        b = 8'b00000101; // 5
        #10;
        a = 8'b00001010; // 10
        b = 8'b00000010; // 2
        #10;
        a = 8'b11111111; // 255
        b = 8'b00000010; // 2
        #10;
        a = 8'b11111111; // 255
        b = 8'b11111111; // 255
        #10;
        $finish;
    end

    initial begin
        $monitor("At time %t, a = %b, b = %b, c = %b", $time, a, b, c);
    end

    initial begin
        $dumpfile("dump_multiply.vcd"); // Name of the VCD file
        $dumpvars(0, testbench_multiply); // Dump all variables in this module
    end
endmodule
