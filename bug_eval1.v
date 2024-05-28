`include "syn_yosys.v"
`include "goodbranch.v"
`include "badbranch.v"

module bug_eval (result);

    wire y1, y2;
    wire [2:0] in_shiftandmult;
    output reg [4:0] result;

    top_1 eval_top_1 (.y(y1), .w(in_shiftandmult));

    wire [3:0] a_num1;
    wire [3:0] a_num2;
    wire [3:0] b_num1;
    wire [3:0] b_num2;
    wire [4:0] a_sum;
    wire [4:0] b_sum;

    goodbranch goodbranch_instance (.num1(a_num1), .num2(a_num2), .sum(a_sum));
    badbranch badbranch_instance (.num1(b_num1), .num2(b_num2), .sum(b_sum));

    assign a_num1 = 4'b0010;
    assign a_num2 = 4'b0001;
    assign b_num1 = 4'b1000;
    assign b_num2 = 4'b0100;

    assign in_shiftandmult = 3'b100;

    always @* begin
        if (y1 == 1) begin
            //GOOD BRANCH
            result = a_sum;
        end
        else begin
            //BAD BRANCH           
            result = b_sum;
        end
    end
endmodule