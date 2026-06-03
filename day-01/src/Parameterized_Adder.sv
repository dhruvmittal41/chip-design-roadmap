module adder #(parameter N = 8)
(
    input [N-1:0] a,
    input [N-1:0] b,
    output [N:0] sum
);

    assign  sum = a + b;
    
endmodule
