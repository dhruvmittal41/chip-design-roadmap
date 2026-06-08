module LFSR(
    input logic clk,rst,en,
    output logic [7:0] lfsr_out,
    output logic done
);

logic [7:0] lfsr_reg;
logic feedback;
logic [7:0] cycle_count;

assign feedback = lfsr_reg[7] ^ lfsr_reg[3] ^ lfsr_reg[2] ^ lfsr_reg[1];

always_ff @(posedge clk) begin
    
    if (rst) begin
        lfsr_reg <= 8'b00000001;
        cycle_count <= 8'b0;
        done <= 0;
    end
    else if (en) begin

        lfsr_reg <= {lfsr_reg[6:0],feedback};
        cycle_count <= cycle_count + 1;
        done <= (cycle_count == 8'd254);
    end

   
end
 assign lfsr_out = lfsr_reg;

    
endmodule