
module goodbranch (num1, num2, out);
    input wire [3:0] num1;
    input wire [3:0] num2;
    output reg [4:0] out;

    initial begin
        out = 5'b00000;
    end
    always @(*) begin
        out = num1 + num2;
    end
endmodule