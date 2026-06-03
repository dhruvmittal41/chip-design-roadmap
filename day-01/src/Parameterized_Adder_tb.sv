module Adder_tb();

reg [3:0] a4,b4;
wire [4:0] sum4;

reg [7:0] a8,b8;
wire [8:0] sum8;

reg [15:0] a16,b16;
wire [16:0] sum16;


adder #(4) adder4(.a(a4),.b(b4),.sum(sum4));
adder #(8) adder8(.a(a8),.b(b8),.sum(sum8));
adder #(16) adder16(.a(a16),.b(b16),.sum(sum16));

 initial begin
        a4  = 4'd3;
        b4  = 4'd5;

        a8  = 8'd20;
        b8  = 8'd15;

        a16 = 16'd1000;
        b16 = 16'd500;

        #20

        $finish;
    end

    initial begin
        $monitor(
            "T=%0t | 4-bit: %d + %d = %d | 8-bit: %d + %d = %d | 16-bit: %d + %d = %d",
            $time,
            a4, b4, sum4,
            a8, b8, sum8,
            a16, b16, sum16
        );

        $dumpfile("adder.vcd");
        $dumpvars(0, Adder_tb);
    end


    
endmodule