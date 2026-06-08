module TLC(
    input logic clk,
    input logic rst,
    output logic [2:0] veh_light,
    output logic [1:0] ped_light
);

    parameter G = 0, Y = 1, R_PED = 2;
    parameter G_time = 8'd10;
    parameter Y_time = 8'd3;
    parameter R_time = 8'd8;

    logic [1:0] state,next_state;
    logic [7:0] counter;


    always @(*) begin

        case (state)
            G : next_state = Y;
            Y : next_state = R_PED;
            R_PED : next_state = G;
            default : next_state = G;
        endcase
 
    end



    always_ff @(posedge clk) begin
        if (rst) begin
            state <= G;
            counter <= 8'd0;
        end 
        else begin

            if((state == G && counter >= G_time -1) || (state == Y && counter >= Y_time-1) || (state == R_PED && counter >= R_time - 1))
            begin
                state <= next_state;
                counter <= 8'd0;
            end else begin
               counter <= counter + 1; 
            end

        end
        
    end

    always_comb begin
       
        veh_light = 3'b100; 
        ped_light = 2'b01;  
        
        case (state)
            G: begin
                veh_light = 3'b001;
                ped_light = 2'b01;  
            end
            Y: begin
                veh_light = 3'b010; 
                ped_light = 2'b01;  
            end
            R_PED: begin
                veh_light = 3'b100; 
                ped_light = 2'b10;  
            end
        endcase
    end

    
endmodule