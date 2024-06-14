`include "bug_eval_combined.v"

module comb;
    reg clk;
    reg rst;
    wire [4:0] result;

    bug_eval bug_eval_instance (.clk(clk), .rst(rst), .result(result));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units clock period (100 MHz clock)
    end

    initial begin
        rst = 1; // Assert reset
        #10 rst = 0; // Deassert reset after 10 time units
    end

    initial begin
        // Run the simulation for a longer duration
        #100;
        $finish;
    end

    // Monitor result at every positive clock edge
    always @(posedge clk) begin
        $display("Time: %0d, Result: %b", $time, result);
    end
endmodule