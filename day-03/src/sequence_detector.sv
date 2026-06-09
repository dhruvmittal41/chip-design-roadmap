module sequence_detector (

    input logic clk,
    input logic rst,
    input logic data_in,
    output logic detected
);


    parameter [1:0] S0 = 2'b00 ;
    parameter [1:0] S1 = 2'b01 ;
    parameter [1:0] S2 = 2'b10 ;
    parameter [1:0] S3 = 2'b11 ;
    reg [1:0] state,next_state;

    always @(*) begin
        
        case(state)

            S0 : next_state = data_in ? S1 : S0;
            S1 : next_state = data_in ? S1 : S2;
            S2 : next_state = data_in ? S3 : S0;
            S3 : next_state = data_in ? S1 : S0;
            default : next_state = S0;

        endcase       

    end

    always_ff @(posedge clk) begin

        if(rst) state <= S0;
        else state <= next_state;
        
    end


    assign detected = (state==S3) && (data_in);


    


endmodule