/* Generated by Yosys 0.8 (git sha1 UNKNOWN, clang 14.0.0-1ubuntu1.1 -fPIC -Os) */

module topmsb_1(y, clk, w);
  input clk;
  input w;
  output y;
  reg y = 1'h0;
  always @(posedge clk)
      y <= w;
endmodule
