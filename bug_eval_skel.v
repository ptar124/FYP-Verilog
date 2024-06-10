`include "syn_yosys.v"
`include "goodbranch.v"
`include "badbranch.v"

module bug_eval (result);

    wire y1, y2;
    wire [2:0] in_shiftandmult;
    output reg [4:0] result;

    top_1 eval_top_1 (.y(y1), .w(in_shiftandmult));
    

    //goodbranch declarations go here

    //badbranch declarations go here

    //instantiate goodbranch

    //instantiate badbranch

    assign in_shiftandmult = 3'b100;

    always @* begin
        if (y1 == 1) begin
            //GOOD BRANCH
            //set result = output of goodbranch
        end
        else begin
            //BAD BRANCH           
            //set result = output of badbranch
        end
    end
endmodule