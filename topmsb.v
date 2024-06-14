module topmsb  (y_1, y_2, clk, w);
  output wire y_1  ;
  output wire y_2  ;
  input wire clk  ;
  input wire [2:0] w  ;
  topmsb_1 topmsb_1 (.y(y_1), .w(w)) ;
  topmsb_2 topmsb_2 (.y(y_2), .w(w)) ;
  always
    @(posedge clk) begin
      assert ((y_1 == y_2));
    end
endmodule
