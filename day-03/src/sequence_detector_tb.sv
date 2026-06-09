

module tb_sequence_detector;

    logic clk;
    logic rst;
    logic data_in;
    logic detected;

   
    sequence_detector dut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .detected(detected)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_sequence_detector);
    end


    task automatic send_stream(
        input [31:0] stream,
        input integer len,
        input [127:0] name
    );
        integer i;

        begin
          
            $display("Testing Stream: %s", name);
       

            for (i = len-1; i >= 0; i = i - 1) begin
                data_in = stream[i];
                @(posedge clk);

                $display("Time=%0t Bit=%0b State=%0d Detected=%0b",
                         $time, stream[i], dut.state, detected);
            end
        end
    endtask

    initial begin

        rst     = 1;
        data_in = 0;

        repeat(2) @(posedge clk);
        rst = 0;

  
        send_stream(32'b1011, 4, "stream1");

        rst = 1; @(posedge clk); rst = 0;

  
        send_stream(32'b1010, 4, "stream2");

        rst = 1; @(posedge clk); rst = 0;

      
        send_stream(32'b0000, 4, "stream3");

        rst = 1; @(posedge clk); rst = 0;

    
        send_stream(32'b1111, 4, "stream4");

        rst = 1; @(posedge clk); rst = 0;

      
        send_stream(32'b1011011, 7, "stream5");

        rst = 1; @(posedge clk); rst = 0;

      
        send_stream(32'b1001011, 7, "stream6");

        rst = 1; @(posedge clk); rst = 0;

        send_stream(32'b010110, 6, "stream7");

        rst = 1; @(posedge clk); rst = 0;

        send_stream(32'b10111011, 8, "stream8");

        rst = 1; @(posedge clk); rst = 0;

      
        send_stream(32'b10101011, 8, "stream9");

        rst = 1; @(posedge clk); rst = 0;

      
        send_stream(32'b011010110, 9, "stream10");

        $display("\nAll tests completed.");
        #10;
        $finish;
    end

endmodule