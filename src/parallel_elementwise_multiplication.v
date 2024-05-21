`include "src/elementwise_multiplication.v"
module parallel_elementwise_multiplication #(parameter N = 8)
                                            (input wire [N-1:0] a [0:N-1],
                                             input wire [N-1:0] b [0:N-1],
                                             input wire [N-1:0] c [0:N-1],
                                             input wire [N-1:0] d [0:N-1],
                                             output wire [2*N-1:0] result_ab [0:N-1],
                                             output wire [2*N-1:0] result_cd [0:N-1]);
    
    elementwise_multiplication #(N) inst_ab (
    .a(a),
    .b(b),
    .result(result_ab)
    );
    
    elementwise_multiplication #(N) inst_cd (
    .a(c),
    .b(d),
    .result(result_cd)
    );
    
endmodule
