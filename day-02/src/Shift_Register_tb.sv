module Shift_Register_tb();

logic clk,rst,load,shift_en,serial_in;
logic [7:0] data_in;
logic [7:0] data_out;
logic serial_out;


Shift_Register dut(.*);

always #5 clk=~clk;

task tick(input int n = 1);

    repeat(n) @ (posedge clk) #1;
    
endtask
    
initial begin
    clk=0;rst=1;load=0;shift_en=0;serial_in=0;data_in=8'b0;

        $display("  8-bit Shift Register Testbench");
    
        $monitor("@%0t | load=%b shift=%b sin=%b | data=%08b | sout=%b",
                  $time, load, shift_en, serial_in, data_out, serial_out);

        
        $display("\n--- TEST 1: Reset ---");
        tick(2);
        rst = 0;

        
        $display("\n--- TEST 2: Parallel Load ---");
        data_in  = 8'b1010_1010;
        load     = 1;
        tick(1);
        load     = 0;

        
        $display("\n--- TEST 3: Shift 4 times (serial_in=1) ---");
        serial_in = 1;
        shift_en  = 1;
        tick(4);
        shift_en  = 0;

        
        $display("\n--- TEST 4: Load 11111111, shift with 0s ---");
        data_in  = 8'b1111_1111;
        load     = 1;
        tick(1);
        load     = 0;
        serial_in = 0;
        shift_en  = 1;
        tick(8);
        shift_en = 0;

        #10 $finish;

end

initial begin
        $dumpfile("wave.vcd");
    $dumpvars(0, Shift_Register_tb);
end


endmodule