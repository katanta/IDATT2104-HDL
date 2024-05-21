module testbench_multiply; reg [7:0] a, b; wire [15:0] c; multiplication uut (.a(a), .b(b), .c(c));
    
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
        $display("Multiplication Results:");
        $monitor("a = %b, b = %b, c = %b", a, b, c);
    end
    
endmodule
