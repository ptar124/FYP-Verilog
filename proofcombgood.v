module proofcombgood (result, out, clk, rst, num1, num2, a_num1, a_num2, y1, y_viv1, y_msb, w_msb);
    output wire [4:0] result;
    output wire [4:0] out;
    input wire clk;
    input wire rst;

    input wire [3:0] num1, num2;
    input wire [3:0] a_num1, a_num2;

    input wire y1, y_viv1, y_msb, w_msb;

    reg first_cycle;

    bug_eval bug_eval (.result(result), .clk(clk), .rst(rst), .a_num1(a_num1), .a_num2(a_num2));
    goodbranch goodbranch (.out(out), .num1(num1), .num2(num2));

    always @(posedge clk or posedge rst) begin
    
      if (rst) begin
        first_cycle <= 1'b1;
    end else begin
        if (first_cycle) begin
          first_cycle <= 1'b0;
        end else begin
            if (
            num1 == a_num1 &&
            num2 == a_num2 &&
            y1 == 1 && y_viv1 == 1 && y_msb == w_msb
            ) begin
                assert(result == out);
            end
        end
    end
  end
endmodule