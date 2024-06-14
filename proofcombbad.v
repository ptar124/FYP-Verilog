module topmsb  (result, out, clk);
  output wire result  ;
  output wire out ;
  input wire clk  ;
  //input wire [2:0] w  ;
  bug_eval bug_eval (.result(result)) ;
  badbranch badbranch (.out(out)) ;
  always
    @(posedge clk) begin
      assert ((result == out));
    end
endmodule
