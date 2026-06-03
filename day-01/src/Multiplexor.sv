module MUX(
    input logic D0,D1,D2,D3,
    input logic [1:0]S,
    output logic Y
);
always_comb begin 
    case (S)
        2'b00 : assign Y = D0;
        2'b01 : assign Y = D1;
        2'b10 : assign Y = D2;
        2'b11 : assign Y = D3;
        default: assign Y = 'b0; 
    endcase
end    
endmodule