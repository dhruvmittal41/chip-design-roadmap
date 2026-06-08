module LFSR_tb();

    logic       clk, rst, en;
    logic [7:0] lfsr_out;
    logic       done;

    LFSR dut (.*);

    always #5 clk = ~clk;


    logic [7:0] seen_values [0:254];
    logic [7:0] prev_val;
    int         error_count;
    int         cycle;

    initial begin
        clk=0; rst=1; en=0;
        error_count=0; cycle=0;

        $display("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
        $display("        8-bit LFSR Testbench");
        $display("  Polynomial: x8 + x4 + x3 + x2 + 1");
        $display("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

        
        @(posedge clk) #1;
        rst = 0;
        en  = 1;

        $display("\nCycle | LFSR Value | Binary     | Feedback");
        $display("──────────────────────────────────────────");

        repeat(255) begin
            @(posedge clk) #1;

            
            foreach(seen_values[i]) begin
                if (i < cycle && seen_values[i] == lfsr_out) begin
                    $display("❌ ERROR: Cycle %0d — Value %08b repeat at cycle %0d!",
                              cycle, lfsr_out, i);
                    error_count++;
                end
            end

            seen_values[cycle] = lfsr_out;

            $display("  %3d | 0x%02h       | %08b   | %b",
                      cycle+1, lfsr_out, lfsr_out,
                      lfsr_out[7]^lfsr_out[3]^lfsr_out[2]^lfsr_out[1]);
            cycle++;
        end

        $display("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
        $display("  Total Cycles Run : 255");
        $display("  Errors Found     : %0d", error_count);

        if (error_count == 0)
            $display("PASS: Sequence never repeated! Max length LFSR confirmed.");
        else
            $display("FAIL: Sequence repeated — check polynomial!");


       
        if (lfsr_out == 8'b0000_0001)
            $display("PASS: Cycle 256 = Seed (0x01). Full period confirmed!");
        else
            $display("FAIL: Did not return to seed!");

        $display("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
        #10 $finish;
    end
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, LFSR_tb);
end

endmodule