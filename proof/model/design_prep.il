# Generated by Yosys 0.36+3 (git sha1 a53032104, clang 10.0.0-4ubuntu1 -fPIC -Os)
autoidx 37
attribute \src "top.v:1.1-12.10"
attribute \top 1
attribute \hdlname "\\top"
attribute \keep 1
module \top
  attribute \src "top.v:8.3-11.8"
  wire $0$formal$top.v:9$1_CHECK[0:0]$3
  attribute \init 1'1
  wire $auto$clk2fflogic.cc:74:sample_control_edge$\clk#sampled$21
  attribute \init 1'0
  wire $auto$clk2fflogic.cc:88:sample_data$$0$formal$top.v:9$1_CHECK[0:0]$3#sampled$29
  wire $auto$clk2fflogic.cc:88:sample_data$$formal$top.v:9$1_CHECK#sampled$27
  attribute \init 1'0
  wire $auto$clk2fflogic.cc:88:sample_data$$formal$top.v:9$1_EN#sampled$17
  attribute \init 1'0
  wire $auto$clk2fflogic.cc:88:sample_data$1'1#sampled$19
  wire $auto$rtlil.cc:2501:Eqx$24
  attribute \keep 1
  attribute \src "top.v:0.0-0.0"
  wire $formal$top.v:9$1_CHECK
  attribute \keep 1
  attribute \src "top.v:0.0-0.0"
  wire $formal$top.v:9$1_EN
  attribute \hdlname "_witness_ anyinit_auto_clk2fflogic_cc_95_sample_data_28"
  wire \_witness_.anyinit_auto_clk2fflogic_cc_95_sample_data_28
  attribute \src "top.v:4.14-4.17"
  wire input 3 \clk
  attribute \src "top.v:5.20-5.21"
  wire width 3 input 4 \w
  attribute \src "top.v:2.15-2.18"
  wire output 1 \y_1
  attribute \src "top.v:3.15-3.18"
  wire output 2 \y_2
  attribute \src "top.v:9.25-10.28"
  cell $assert $assert$top.v:9$6
    connect \A \_witness_.anyinit_auto_clk2fflogic_cc_95_sample_data_28
    connect \EN $formal$top.v:9$1_EN
  end
  cell $mux $auto$clk2fflogic.cc:110:mux$25
    parameter \WIDTH 1
    connect \A $auto$clk2fflogic.cc:88:sample_data$$formal$top.v:9$1_EN#sampled$17
    connect \B $auto$clk2fflogic.cc:88:sample_data$1'1#sampled$19
    connect \S $auto$rtlil.cc:2501:Eqx$24
    connect \Y $formal$top.v:9$1_EN
  end
  cell $mux $auto$clk2fflogic.cc:110:mux$35
    parameter \WIDTH 1
    connect \A $auto$clk2fflogic.cc:88:sample_data$$formal$top.v:9$1_CHECK#sampled$27
    connect \B $auto$clk2fflogic.cc:88:sample_data$$0$formal$top.v:9$1_CHECK[0:0]$3#sampled$29
    connect \S $auto$rtlil.cc:2501:Eqx$24
    connect \Y \_witness_.anyinit_auto_clk2fflogic_cc_95_sample_data_28
  end
  cell $ff $auto$clk2fflogic.cc:79:sample_control_edge$22
    parameter \WIDTH 1
    connect \D \clk
    connect \Q $auto$clk2fflogic.cc:74:sample_control_edge$\clk#sampled$21
  end
  cell $eqx $auto$clk2fflogic.cc:80:sample_control_edge$23
    parameter \A_SIGNED 0
    parameter \A_WIDTH 2
    parameter \B_SIGNED 0
    parameter \B_WIDTH 2
    parameter \Y_WIDTH 1
    connect \A { $auto$clk2fflogic.cc:74:sample_control_edge$\clk#sampled$21 \clk }
    connect \B 2'01
    connect \Y $auto$rtlil.cc:2501:Eqx$24
  end
  attribute \clk2fflogic 1
  cell $ff $auto$clk2fflogic.cc:95:sample_data$18
    parameter \WIDTH 1
    connect \D $formal$top.v:9$1_EN
    connect \Q $auto$clk2fflogic.cc:88:sample_data$$formal$top.v:9$1_EN#sampled$17
  end
  cell $ff $auto$clk2fflogic.cc:95:sample_data$20
    parameter \WIDTH 1
    connect \D 1'1
    connect \Q $auto$clk2fflogic.cc:88:sample_data$1'1#sampled$19
  end
  attribute \clk2fflogic 1
  cell $anyinit $auto$clk2fflogic.cc:95:sample_data$28
    parameter \WIDTH 1
    connect \D \_witness_.anyinit_auto_clk2fflogic_cc_95_sample_data_28
    connect \Q $auto$clk2fflogic.cc:88:sample_data$$formal$top.v:9$1_CHECK#sampled$27
  end
  cell $ff $auto$clk2fflogic.cc:95:sample_data$30
    parameter \WIDTH 1
    connect \D $0$formal$top.v:9$1_CHECK[0:0]$3
    connect \Q $auto$clk2fflogic.cc:88:sample_data$$0$formal$top.v:9$1_CHECK[0:0]$3#sampled$29
  end
  attribute \src "top.v:10.16-10.26"
  cell $eq $eq$top.v:10$5
    parameter \A_SIGNED 0
    parameter \A_WIDTH 1
    parameter \B_SIGNED 0
    parameter \B_WIDTH 1
    parameter \Y_WIDTH 1
    connect \A \y_1
    connect \B \y_2
    connect \Y $0$formal$top.v:9$1_CHECK[0:0]$3
  end
  attribute \module_not_derived 1
  attribute \src "top.v:6.9-6.31"
  cell \top_1 \top_1
    connect \w \w
    connect \y \y_1
  end
  attribute \module_not_derived 1
  attribute \src "top.v:7.9-7.31"
  cell \top_2 \top_2
    connect \w \w
    connect \y \y_2
  end
  connect $formal$top.v:9$1_CHECK \_witness_.anyinit_auto_clk2fflogic_cc_95_sample_data_28
end
attribute \src "syn_yosys.v:3.1-9.10"
attribute \hdlname "\\top_1"
module \top_1
  attribute \src "syn_yosys.v:8.20-8.27"
  wire $not$syn_yosys.v:8$13_Y
  attribute \src "syn_yosys.v:7.18-7.29"
  wire $or$syn_yosys.v:7$11_Y
  attribute \src "syn_yosys.v:4.8-4.11"
  wire \_0_
  attribute \src "syn_yosys.v:5.15-5.16"
  wire width 3 input 2 \w
  attribute \src "syn_yosys.v:6.10-6.11"
  wire output 1 \y
  attribute \src "syn_yosys.v:8.14-8.27"
  cell $and $and$syn_yosys.v:8$14
    parameter \A_SIGNED 0
    parameter \A_WIDTH 1
    parameter \B_SIGNED 0
    parameter \B_WIDTH 1
    parameter \Y_WIDTH 1
    connect \A \_0_
    connect \B $not$syn_yosys.v:8$13_Y
    connect \Y \y
  end
  attribute \src "syn_yosys.v:7.16-7.30"
  cell $not $not$syn_yosys.v:7$12
    parameter \A_SIGNED 0
    parameter \A_WIDTH 1
    parameter \Y_WIDTH 1
    connect \A $or$syn_yosys.v:7$11_Y
    connect \Y \_0_
  end
  attribute \src "syn_yosys.v:8.20-8.27"
  cell $not $not$syn_yosys.v:8$13
    parameter \A_SIGNED 0
    parameter \A_WIDTH 1
    parameter \Y_WIDTH 1
    connect \A \w [2]
    connect \Y $not$syn_yosys.v:8$13_Y
  end
  attribute \src "syn_yosys.v:7.18-7.29"
  cell $or $or$syn_yosys.v:7$11
    parameter \A_SIGNED 0
    parameter \A_WIDTH 1
    parameter \B_SIGNED 0
    parameter \B_WIDTH 1
    parameter \Y_WIDTH 1
    connect \A \w [1]
    connect \B \w [0]
    connect \Y $or$syn_yosys.v:7$11_Y
  end
end
attribute \src "syn_identity.v:1.1-5.10"
attribute \hdlname "\\top_2"
module \top_2
  attribute \src "syn_identity.v:4.24-4.36"
  wire width 3 $mul$syn_identity.v:4$9_Y
  attribute \src "syn_identity.v:3.16-3.17"
  wire width 3 input 2 \w
  attribute \src "syn_identity.v:2.11-2.12"
  wire output 1 \y
  attribute \src "syn_identity.v:4.24-4.36"
  cell $mul $mul$syn_identity.v:4$9
    parameter \A_SIGNED 0
    parameter \A_WIDTH 3
    parameter \B_SIGNED 0
    parameter \B_WIDTH 2
    parameter \Y_WIDTH 2
    connect \A \w
    connect \B 2'11
    connect \Y $mul$syn_identity.v:4$9_Y [2:1]
  end
  attribute \src "syn_identity.v:4.15-4.37"
  cell $shr $shr$syn_identity.v:4$10
    parameter \A_SIGNED 0
    parameter \A_WIDTH 1
    parameter \B_SIGNED 0
    parameter \B_WIDTH 3
    parameter \Y_WIDTH 1
    connect \A 1'1
    connect \B { $mul$syn_identity.v:4$9_Y [2:1] 1'0 }
    connect \Y \y
  end
  connect $mul$syn_identity.v:4$9_Y [0] 1'0
end
