module Shift_Register(
    input logic clk,
    input logic rst,
    input logic load,
    input logic shift_en,
    input logic serial_in,
    input logic [7:0] data_in,
    output logic [7:0] data_out,
    output logic serial_out
);

assign serial_out = data_out[0];

always_ff @(posedge clk) begin

    if(rst) begin

        data_out <= 8'b0;

    end

    else if (load) begin

        data_out <= data_in;

    end

    else if (shift_en) begin

        data_out <= {serial_in,data_out[7:1]};

    end

end

    
endmodule