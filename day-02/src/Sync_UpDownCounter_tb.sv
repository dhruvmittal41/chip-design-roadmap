module counter_tb();

    logic       clk, rst, load, en, up_down;
    logic [3:0] data_in;
    logic [3:0] count;
    logic       overflow, underflow;

    updown_counter dut (.*);

    always #5 clk = ~clk;

    task tick(input int n = 1);
        repeat(n) @(posedge clk) #1;
    endtask

    initial begin
        clk=0; rst=1; load=0; en=0;
        up_down=1; data_in=4'b0;

       
        $display("    4-bit Up/Down Counter Testbench");
       
        $monitor("@%0t | en=%b ud=%b | count=%04b (%0d) | OVF=%b UNF=%b",
                  $time, en, up_down, count, count, overflow, underflow);

     
        $display("\n--- TEST 1: Reset ---");
        tick(2); rst=0;

        $display("\n--- TEST 2: Count UP 0 to 15 ---");
        en=1; up_down=1;
        tick(16);   
        en=0;

        
        $display("\n--- TEST 3: Parallel Load = 1010 ---");
        data_in=4'b1010; load=1;
        tick(1); load=0;

        
        $display("\n--- TEST 4: Count DOWN from 10 ---");
        en=1; up_down=0;
        tick(12);  
        en=0;

      
        $display("\n--- TEST 5: Enable=0, should hold ---");
        tick(3);

        #10 $finish;
    end

  initial begin
        $dumpfile("wave.vcd");
    $dumpvars(0,counter_tb);
end

endmodule