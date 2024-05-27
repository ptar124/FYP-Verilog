`include "syn_yosys.v"

module bug_eval (result);

    wire y1, y2;
    wire [2:0] in;
    output wire [4:0] result;

    top_1 eval_top_1 (.y(y1), .w(in));

    assign in = 3'b100;

    wire [3:0] a_num1;
    wire [3:0] a_num2;
    wire [3:0] b_num1;
    wire [3:0] b_num2;

    assign a_num1 = 4'b0010;
    assign a_num2 = 4'b0001;
    assign b_num1 = 4'b1000;
    assign b_num2 = 4'b0100;

    reg [4:0] a_sum;
    reg [4:0] b_sum;

    always @* begin

        if (y1 == 1) begin
            //GOOD BRANCH
            a_sum = a_num1 + a_num2;
            result = a_sum;
        end
        else begin
            //BAD BRANCH
            b_sum = b_num1 + b_num2;
            result = b_sum;
        end
    end
endmodule