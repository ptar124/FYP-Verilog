# Generated by Yosys 0.36+3 (git sha1 a53032104, clang 10.0.0-4ubuntu1 -fPIC -Os)
autoidx 21
attribute \keep 1
attribute \hdlname "\\topmsb"
attribute \top 1
attribute \src "topmsb.v:1.1-12.10"
module \topmsb
  attribute \src "topmsb.v:8.3-11.8"
  wire $0$formal$topmsb.v:9$2_CHECK[0:0]$4
  attribute \src "topmsb.v:0.0-0.0"
  wire $formal$topmsb.v:9$2_CHECK
  attribute \init 1'0
  attribute \src "topmsb.v:0.0-0.0"
  wire $formal$topmsb.v:9$2_EN
  attribute \src "topmsb.v:4.14-4.17"
  wire input 3 \clk
  attribute \src "topmsb.v:5.20-5.21"
  wire width 3 input 4 \w
  attribute \src "topmsb.v:2.15-2.18"
  wire output 1 \y_1
  attribute \src "topmsb.v:3.15-3.18"
  wire output 2 \y_2
  attribute \src "topmsb.v:9.25-10.28"
  cell $assert $assert$topmsb.v:9$7
    connect \A $formal$topmsb.v:9$2_CHECK
    connect \EN $formal$topmsb.v:9$2_EN
  end
  attribute \src "topmsb.v:10.16-10.26"
  cell $eq $eq$topmsb.v:10$6
    parameter \A_SIGNED 0
    parameter \A_WIDTH 1
    parameter \B_SIGNED 0
    parameter \B_WIDTH 1
    parameter \Y_WIDTH 1
    connect \A \y_1
    connect \B \y_2
    connect \Y $0$formal$topmsb.v:9$2_CHECK[0:0]$4
  end
  attribute \src "topmsb.v:8.3-11.8"
  cell $dff $procdff$19
    parameter \CLK_POLARITY 1'1
    parameter \WIDTH 1
    connect \CLK \clk
    connect \D $0$formal$topmsb.v:9$2_CHECK[0:0]$4
    connect \Q $formal$topmsb.v:9$2_CHECK
  end
  attribute \src "topmsb.v:8.3-11.8"
  cell $dff $procdff$20
    parameter \CLK_POLARITY 1'1
    parameter \WIDTH 1
    connect \CLK \clk
    connect \D 1'1
    connect \Q $formal$topmsb.v:9$2_EN
  end
  attribute \module_not_derived 1
  attribute \src "topmsb.v:6.12-6.37"
  cell \topmsb_1 \topmsb_1
    connect \w \w [0]
    connect \y \y_1
  end
  attribute \module_not_derived 1
  attribute \src "topmsb.v:7.12-7.37"
  cell \topmsb_2 \topmsb_2
    connect \w \w [0]
    connect \y \y_2
  end
end
attribute \hdlname "\\topmsb_1"
attribute \src "syn_wrongmsb.v:3.1-10.10"
module \topmsb_1
  attribute \src "syn_wrongmsb.v:4.9-4.12"
  wire input 2 \clk
  attribute \src "syn_wrongmsb.v:5.9-5.10"
  wire input 3 \w
  attribute \init 1'0
  attribute \src "syn_wrongmsb.v:6.10-6.11"
  wire output 1 \y
  attribute \src "syn_wrongmsb.v:8.3-9.14"
  cell $dff $procdff$16
    parameter \CLK_POLARITY 1'1
    parameter \WIDTH 1
    connect \CLK \clk
    connect \D \w
    connect \Q \y
  end
end
attribute \hdlname "\\topmsb_2"
attribute \src "wrongmsb_identity.v:1.1-10.10"
module \topmsb_2
  attribute \src "wrongmsb_identity.v:3.10-3.13"
  wire input 2 \clk
  attribute \src "wrongmsb_identity.v:3.15-3.16"
  wire input 3 \w
  attribute \init 1'0
  attribute \src "wrongmsb_identity.v:2.15-2.16"
  wire output 1 \y
  attribute \src "wrongmsb_identity.v:5.4-9.25"
  cell $dff $procdff$17
    parameter \CLK_POLARITY 1'1
    parameter \WIDTH 1
    connect \CLK \clk
    connect \D \w
    connect \Q \y
  end
end
