module TFF(
    input clk,
    input T,
    output reg q
);

    initial q = 0;

    always @(posedge clk) begin
        if (T)
            q <= ~q;
    end

endmodule