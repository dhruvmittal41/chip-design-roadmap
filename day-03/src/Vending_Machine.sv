module Ve   nding_Machine(
    input logic clk,
    input logic rst,
    input logic Five,
    input logic Ten,
    output logic dispense
);


    parameter Z = 2'b00;
    parameter F = 2'b01;
    parameter T = 2'b10;
    parameter TF = 2'b11;

    logic [4:0] count;

    reg [1:0] state, next_state;

    always @(*) begin
        
        case(state)

        Z : next_state = Five ? F : Ten ? T : (count == 5'b1101) ? TF : Z;
        F : next_state = Five ? F :  Ten ? T : (count == 5'b1101) ? TF : Z;
        T : next_state = Five ? F : Ten ? T : (count == 5'b1101) ? TF : Z ;
        TF : next_state = Z ;


        endcase

    end


    always_ff @(posedge clk) begin
        
        if(rst) state <= Z;
        else state <= next_state;

    end


    always_ff @(posedge clk) begin
        
        if(rst) count <= 5'b0;
        else if(Five) count <= count + 3'b101;
        else if (Ten) count <= count + 4'b1010;


    end


    assign dispense = ( state == TF) ? 1:0;

    
endmodule