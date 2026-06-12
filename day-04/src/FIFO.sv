module FIFO #(
    parameter int DEPTH = 8,
    parameter int WIDTH = 8
)
(
    input  logic clk,
    input  logic rst,

    input  logic wr_en,
    input  logic rd_en,

    input  logic [WIDTH-1:0] data_in,
    output logic [WIDTH-1:0] data_out,

    output logic full,
    output logic almost_full,
    output logic empty,
    output logic almost_empty
);


   
    localparam PTR_WIDTH = $clog2(DEPTH);


   
    logic [WIDTH-1:0] mem [DEPTH];


   
    logic [PTR_WIDTH-1:0] wr_ptr;
    logic [PTR_WIDTH-1:0] rd_ptr;


    logic [$clog2(DEPTH+1)-1:0] count;



    always_ff @(posedge clk) begin

        if(rst) begin

            wr_ptr   <= 0;
            rd_ptr   <= 0;
            count    <= 0;
            data_out <= 0;

        end


        else begin


        
            if(wr_en && !full) begin

                mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1;

            end


            if(rd_en && !empty) begin

                data_out <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1;

            end




            if((wr_en && !full) && !(rd_en && !empty))
                count <= count + 1;

            else if((rd_en && !empty) && !(wr_en && !full))
                count <= count - 1;


        end

    end



  

    assign empty = (count == 0);

    assign almost_empty = (count <= 2);
    
    assign full  = (count == DEPTH);

    assign almost_full = (count >= DEPTH - 2);


endmodule