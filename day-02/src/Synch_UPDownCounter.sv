module updown_counter(
    input logic clk,rst,load,en,up_down,
    input logic [3:0] data_in,
    output logic [3:0] count,
    output logic overflow,
    output logic underflow
);
  
    always_ff @(posedge clk) begin
        
        if (rst) begin
            count <= 4'b0;
        end
        else if (load) begin
            count <= data_in;            
        end
        else if (en) begin

            if (up_down)
                count <= count + 1;
            
            else 
                count <= count - 1;
            
            
        end
    end

    assign overflow = (count == 4'hF) && en && up_down;
    assign underflow = (count == 4'b0) && en && (~up_down);


endmodule