module top_vivado  (y, w0);
   output [1:0] y;
   input        w0;
   assign y = $signed(2'h1 < 2'h2) >> w0 ? 1'b1 : 1'b0;
endmodule
