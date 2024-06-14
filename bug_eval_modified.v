`include "syn_yosys.v"
//`include "syn_vivado.v"
`include "syn_wrongmsb.v"
`include "goodbranch.v"
`include "badbranch.v"

module bug_eval (
    input wire clk,
    input wire rst,
    //goodbranchdec ,
    //badbranchdec
);

    wire y1, y2;
    wire [2:0] in_shiftandmult;
    wire y_viv1;
    wire w0_viv1;
    wire y_msb;
    wire w_msb;

    top_1 eval_top_1 (.y(y1), .w(in_shiftandmult));
    //top_vivado eval_top_vivado (.y(y_viv1), .w0(w0_viv1));
    topmsb_1 eval_topmsb_1 (.y(y_msb), .w(w_msb), .clk(clk));
   
    assign in_shiftandmult = 3'b100;
    //assign w0_viv1 = 1'b0;
    assign y_viv1 = 1;
    assign w_msb = 1;

    assign a_num1 = 1;
    assign a_num2 = 2;
    assign b_num1 = 4;
    assign b_num2 = 8;

    goodbranch goodbranch_instance (
        //goodbranchinst

    );
    badbranch badbranch_instance (
        //badbranchinst
        
    );

    always @* begin
        if (y1 == 1 && y_viv1 == 1 && y_msb == w_msb) begin
            //GOOD BRANCH
            result = a_out;
        end
        else begin
            //BAD BRANCH           
            result = b_out;
        end
    end
endmodule
