`include "syn_identity.v"
`include "syn_yosys.v"

module testbench;
   wire y1, y2;
   wire [2:0] in;

   top_1 top_1 (.y(y1), .w(in));
   top_2 top_2 (.y(y2), .w(in));

   assign in = 3'b100;

   initial begin
      #10;
      $display("Yosys: %d\nRTL: %d", y1, y2);
      $finish;
   end
endmodule // testbench
