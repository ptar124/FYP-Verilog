// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Tue Jun 11 15:30:06 2019
// Host        : yann-arch running 64-bit unknown
// Command     : write_verilog -force syn_vivado.v
// Design      : top_vivado
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7k70tfbg676-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* STRUCTURAL_NETLIST = "yes" *)
module top_vivado
   (y,
    w0);
  output [1:0]y;
  input w0;

  wire \<const0> ;
  wire [1:0]y;

  GND GND
       (.G(\<const0> ));
  OBUF \y_OBUF[0]_inst 
       (.I(\<const0> ),
        .O(y[0]));
  OBUF \y_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(y[1]));
endmodule
