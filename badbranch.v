//vivado
module badbranch (num1, num2, out);
    input wire [3:0] num1;
    input wire [3:0] num2;
    output wire [4:0] out;

    assign sum = num1 + num2;
endmodule