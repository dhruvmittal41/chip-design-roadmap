module DFF_tb();

    reg clk,d,ar;
    reg q;

    DFF DFF0(.clk(clk),.d(d),.ar(ar),.q(q));

    always #1 clk = ~clk;

    initial begin
        clk =0;d = 0; ar = 0;
        #2 d = 1; ar = 0;
        #2 d = 0; ar = 1;
        #2 d = 1; ar = 1;
        #10 $finish;
    end

   initial begin

        $monitor("Time=%0t clk=%b d=%b ar=%b q=%b",
                 $time, clk, d, ar, q);

        $dumpfile("wave.vcd");
        $dumpvars(0, DFF_tb);
        
    end
    
endmodule