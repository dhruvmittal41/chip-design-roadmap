module TLC_tb();

    logic clk, rst;
    logic [2:0] veh_light;
    logic [1:0] ped_light;  

    TLC dut (.*);

    always #5 clk = ~clk; 

    initial begin
        clk = 0; rst = 1;

        $display("Traffic Light Controller");
        
        $monitor("Time: %3t | Veh(RYG): %b | Ped(Walk/Stop): %b | Internal Timer: %0d", 
                  $time, veh_light, ped_light, dut.counter);

        #10 rst = 0;
        #250 $finish;
    end
    initial begin
        $dumpfile("wave.vcd");
    $dumpvars(0, TLC_tb);
end
    
endmodule