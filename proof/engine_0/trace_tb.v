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
  wire [0:0] PI_clk = clock;
  reg [2:0] PI_w;
  top UUT (
    .clk(PI_clk),
    .w(PI_w)
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
    // UUT.$auto$clk2fflogic.\cc:74:sample_control_edge$/clk#sampled$21  = 1'b1;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$$0$formal$top .\v:9$1_CHECK[0:0]$3#sampled$29  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$$formal$top .\v:9$1_CHECK#sampled$27  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$$formal$top .\v:9$1_EN#sampled$17  = 1'b0;
    // UUT.$auto$clk2fflogic.\cc:88:sample_data$1'1#sampled$19  = 1'b0;

    // state 0
    PI_w = 3'b100;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_w <= 3'b000;
    end

    genclock <= cycle < 1;
    cycle <= cycle + 1;
  end
endmodule
