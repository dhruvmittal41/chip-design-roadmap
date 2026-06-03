module PriorityEncoder_tb();
    
    reg en;
    reg [7:0]i;
    wire [2:0]y;

    PriorityEncoder PE1(.en(en),.i(i),.y(y));

    initial begin
        en=0;i='b0;
        #10 en=1;i=8'b00000001;
        #10 en=1;i=8'b00000011;
        #10 en=1;i=8'b00000111;
        #10 en=1;i=8'b00001111;
        #10 en=1;i=8'b00011111;
        #10 en=1;i=8'b00111111;
        #10 en=1;i=8'b01111111;
        #10 en=1;i=8'b11111111;

        #50 $finish;
    end

         initial begin

        $monitor("Time=%0t en=%b i=%b y=%b",
                 $time,en,i,y);

        $dumpfile("wave.vcd");
        $dumpvars(0, PriorityEncoder_tb);
        
    end

endmodule