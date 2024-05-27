`include "syn_yosys.v"

module bug_eval (result);

    wire y1, y2;
    wire [2:0] in_shiftandmult;
    output reg [4:0] result;

    top_1 eval_top_1 (.y(y1), .w(in_shiftandmult));

    assign in_shiftandmult = 3'b100;

    reg [3:0] a_num1;
    reg [3:0] a_num2;
    reg [3:0] b_num1;
    reg [3:0] b_num2;

    reg [4:0] a_sum;
    reg [4:0] b_sum;

    always @* begin
        a_num1 = 4'b0010;
        a_num2 = 4'b0001;
        b_num1 = 4'b1000;
        b_num2 = 4'b0100;

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