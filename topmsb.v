module topmsb  (y_1, y_2, clk, w);
  output wire y_1  ;
  output wire y_2  ;
  input wire clk  ;
  input wire [2:0] w  ;
  top_1 top_1 (.y(y_1), .w(w)) ;
  top_2 top_2 (.y(y_2), .w(w)) ;
  always
    @(posedge clk) begin
      assert ((y_1 == y_2));
    end
endmodule
