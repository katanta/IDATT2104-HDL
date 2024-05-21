module testbench; reg a, b; wire c; and_gate uut (.a(a), .b(b), .c(c));
    
    initial begin
        // Initialize inputs
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $finish;
    end
    
    initial begin
        $display("And Gate Results:");
        $monitor("a = %b, b = %b, c = %b", a, b, c);
    end
    
    initial begin
        $dumpfile("dump_and_gate.vcd"); // Name of the VCD file
        $dumpvars(0, testbench); // Dump all variables in this module
    end
    
endmodule
