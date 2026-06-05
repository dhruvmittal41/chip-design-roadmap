module TFF_tb();

    reg clk, T;
    wire q;

    TFF TFF0(.clk(clk),.T(T),.q(q));

    always #1 clk = ~clk;

    initial begin
        clk = 0;
        T = 0;
        #2 T = 1;
        #2 T = 0;   
        #4 $finish;
    end

    initial begin
        $monitor("Time=%0t clk=%b T=%b q=%b",
                 $time, clk, T, q);

        $dumpfile("wave.vcd");
        $dumpvars(0, TFF_tb);
    end

endmodule