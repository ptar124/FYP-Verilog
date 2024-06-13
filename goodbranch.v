//vivado
module goodbranch (num1, num2, sum);
    input wire [3:0] num1;
    input wire [3:0] num2;
    output wire [4:0] sum;

    assign sum = num1 + num2;
endmodule