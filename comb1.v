`include "bug_eval_combined.v"

module comb;
    wire [4:0] result;

    bug_eval bug_eval_instance (.result(result));

    initial begin
        #10;
        $display("Result: %b", result);
        $finish;
    end
endmodule