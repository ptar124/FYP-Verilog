/* Generated by Yosys 0.36+3 (git sha1 a53032104, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top_1(y, w);
  input [2:0] w;
  wire [2:0] w;
  output y;
  wire y;
  assign y = ~(w[1] | w[0]);
endmodule