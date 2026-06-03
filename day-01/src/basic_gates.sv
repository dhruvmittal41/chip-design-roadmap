module AND(
    input a,b,
    output c
);

    assign c = a & b;
    
endmodule


module OR(
    input a,b,
    output c
);

    assign c = a | b;
    
endmodule

module XOR(
    input a,b,
    output c
);  

    assign c = a^b;
    
endmodule