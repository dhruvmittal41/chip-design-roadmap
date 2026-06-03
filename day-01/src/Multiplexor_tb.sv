module Multiplexor_tb();

    reg D0,D1,D2,D3;
    reg [1:0]S;
    wire Y;

    MUX MUX1(.D0(D0),.D1(D1),.D2(D2),.D3(D3),.S(S),.Y(Y));

    initial begin
        #10 D0=1;D1=0;D2=0;D3=0;S=2'b00;
        #10 D0=0;D1=1;D2=0;D3=0;S=2'b01;
        #10 D0=0;D1=0;D2=1;D3=0;S=2'b10;
        #10 D0=0;D1=0;D2=0;D3=1;S=2'b11;
    end

     initial begin

        $monitor("Time=%0t D0=%b D1=%b D2=%b D3=%b S=%b Y=%b",
                 $time,D0,D1,D2,D3,S,Y);

        $dumpfile("wave.vcd");
        $dumpvars(0, Multiplexor_tb);
        
    end
    
endmodule