`include "syn_yosys.v"
`include "goodbranch.v"
`include "badbranch.v"

module bug_eval (result);

    wire y1, y2;
    wire [2:0] in_shiftandmult;
    output reg [4:0] result;

    top_1 eval_top_1 (.y(y1), .w(in_shiftandmult));

    module goodbranch (num1, num2, sum);
    input wire [3:0] a_num1;
    input wire [3:0] a_num2;
    output wire [4:0] a_sum;

    assign sum = num1 + num2;
endmoduleere

    module badbranch (num1, num2, sum);
    input wire [3:0] b_num1;
    input wire [3:0] b_num2;
    output wire [4:0] b_sum;

    assign sum = num1 + num2;
endmoduleere

    goodbranch goodbranch_instance (.num1(a_num1), .num2(a_num2), .sum(a_sum));h

    badbranch badbranch_instance (.num1(b_num1), .num2(b_num2), .sum(b_sum));h

    assign in_shiftandmult = 3'b100;

    always @* begin
        if (y1 == 1) begin
            //GOOD BRANCH
            result = a_sum;h
        end
        else begin
            //BAD BRANCH           
            result = b_sum;h
        end
    end
endmodule