/* Generated by Yosys 0.36+3 (git sha1 a53032104, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module topmsb_1(y, clk, w);
  input clk;
  wire clk;
  input w;
  wire w;
  output y;
  reg y = 1'h0;
  always @(posedge clk)
    y <= w;
endmodule
