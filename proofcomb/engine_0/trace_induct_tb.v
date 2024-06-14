`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  reg [0:0] PI_rst;
  reg [3:0] PI_a_num2;
  wire [0:0] PI_clk = clock;
  reg [3:0] PI_num1;
  reg [3:0] PI_a_num1;
  reg [3:0] PI_num2;
  proofcombgood UUT (
    .rst(PI_rst),
    .a_num2(PI_a_num2),
    .clk(PI_clk),
    .num1(PI_num1),
    .a_num1(PI_a_num1),
    .num2(PI_num2)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$auto$clk2fflogic.\cc:62:sample_control$/rst#sampled$64  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:74:sample_control_edge$/clk#sampled$58  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$$0$formal$proofcombgood .\v:23$13_CHECK[0:0]$15#sampled$72  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$$0$formal$proofcombgood .\v:23$13_EN[0:0]$16#sampled$56  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$$formal$proofcombgood .\v:23$13_CHECK#sampled$70  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$$formal$proofcombgood .\v:23$13_EN#sampled$54  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$/first_cycle#sampled$86  = 1'b0;
    // UUT.bug_eval.eval_topmsb_1.$auto$clk2fflogic.\cc:74:sample_control_edge$/clk#sampled$48  = 1'b0;
    // UUT.bug_eval.eval_topmsb_1.$auto$clk2fflogic.\cc:88:sample_data$/w#sampled$46  = 1'b0;
    // UUT.bug_eval.eval_topmsb_1.$auto$clk2fflogic.\cc:88:sample_data$/y#sampled$44  = 1'b1;

    // state 0
    PI_rst = 1'b0;
    PI_a_num2 = 4'b0010;
    PI_num1 = 4'b0000;
    PI_a_num1 = 4'b0001;
    PI_num2 = 4'b0000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 2
    if (cycle == 1) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 3
    if (cycle == 2) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 4
    if (cycle == 3) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 5
    if (cycle == 4) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 6
    if (cycle == 5) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 7
    if (cycle == 6) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 8
    if (cycle == 7) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 9
    if (cycle == 8) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 10
    if (cycle == 9) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 11
    if (cycle == 10) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 12
    if (cycle == 11) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 13
    if (cycle == 12) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 14
    if (cycle == 13) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 15
    if (cycle == 14) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 16
    if (cycle == 15) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 17
    if (cycle == 16) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 18
    if (cycle == 17) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    // state 19
    if (cycle == 18) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0001;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0010;
    end

    // state 20
    if (cycle == 19) begin
      PI_rst <= 1'b0;
      PI_a_num2 <= 4'b0010;
      PI_num1 <= 4'b0000;
      PI_a_num1 <= 4'b0001;
      PI_num2 <= 4'b0000;
    end

    genclock <= cycle < 20;
    cycle <= cycle + 1;
  end
endmodule
