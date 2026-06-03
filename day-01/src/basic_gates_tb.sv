module basic_gates_tb();

    reg a;
    reg b;
    wire AND;
    wire OR;
    wire XOR;


    AND AND1(.a(a),.b(b),.c(AND));
    OR  OR1(.a(a),.b(b),.c(OR));
    XOR XOR1(.a(a),.b(b),.c(XOR));

    initial begin

        a = 0;b = 0;
        #10 a = 0;b = 1;
        #10 a = 1;b = 0;
        #10 a = 1;b = 1;

        #50 $finish;
    end

     initial begin

        $monitor("Time=%0t A=%b B=%b AND=%b OR=%b XOR=%b",
                 $time, a, b,AND,OR,XOR);

        $dumpfile("wave.vcd");
        $dumpvars(0, basic_gates_tb);
        
    end


endmodule