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
  reg [2:0] PI_w;
  wire [0:0] PI_clk = clock;
  topmsb UUT (
    .w(PI_w),
    .clk(PI_clk)
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
    // UUT.$auto$clk2fflogic.\cc:74:sample_control_edge$/clk#sampled$45  = 1'b1;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$$0$formal$topmsb .\v:9$2_CHECK[0:0]$4#sampled$53  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$$formal$topmsb .\v:9$2_CHECK#sampled$51  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$$formal$topmsb .\v:9$2_EN#sampled$41  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$1'1#sampled$43  = 1'b0;
    // UUT.topmsb_1.$auto$clk2fflogic.\cc:74:sample_control_edge$/clk#sampled$35  = 1'b1;
    // UUT.topmsb_1.$auto$clk2fflogic.\cc:88:sample_data$/w#sampled$33  = 1'b0;
    // UUT.topmsb_1.$auto$clk2fflogic.\cc:88:sample_data$/y#sampled$31  = 1'b0;
    // UUT.topmsb_2.$auto$clk2fflogic.\cc:74:sample_control_edge$/clk#sampled$25  = 1'b1;
    // UUT.topmsb_2.$auto$clk2fflogic.\cc:88:sample_data$/w#sampled$23  = 1'b0;
    // UUT.topmsb_2.$auto$clk2fflogic.\cc:88:sample_data$/y#sampled$21  = 1'b0;

    // state 0
    PI_w = 3'b001;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_w <= 3'b000;
    end

    // state 2
    if (cycle == 1) begin
      PI_w <= 3'b000;
    end

    genclock <= cycle < 2;
    cycle <= cycle + 1;
  end
endmodule
