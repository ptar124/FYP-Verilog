
module goodbranch (num1, num2, out);
    input wire [3:0] num1;
    input wire [3:0] num2;
    output wire [4:0] out;

    //assign out = 0;

    assign out = num1 + num2;
endmodule