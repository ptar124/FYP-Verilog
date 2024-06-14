./stitch.sh

sed 's/top/top_1/' rtl.v > rtl_yosys.v
sed 's/top/top_2/' rtl.v > syn_identity.v

sed 's/topmsb/topmsb_1/' wrongmsb.v > wrongmsb_yosys.v
sed 's/topmsb/topmsb_2/' wrongmsb.v > wrongmsb_identity.v

#/mnt/c/Users/ptar1/Documents/yosys-yosys-0.8b/yosys-yosys-0.8b/build/yosys -p 'read -formal rtl_yosys.v; synth; write_verilog -noattr syn_yosys.v'
/mnt/c/Users/ptar1/Documents/yosys-yosys-0.9b/yosys-yosys-0.9b/build/yosys -p 'read_verilog -formal wrongmsb_yosys.v; synth; write_verilog -noattr syn_wrongmsb.v'

yosys -p 'read_verilog -formal rtl_yosys.v; synth; write_verilog -noattr syn_yosys.v'
#yosys -p 'read_verilog -formal wrongmsb_yosys.v; synth; write_verilog -noattr syn_wrongmsb.v'

#sby -f proof.sby
#sby -f proofmsb.sby

iverilog -o main testbench.v

#yosys -p 'read_verilog -formal bug_eval2.v; synth; write_verilog -noattr syn_bug_eval2_yosys.v'
yosys -p 'read_verilog -formal bug_eval_combined.v; synth; write_verilog -noattr syn_bug_eval_combined.v'
#yosys -p 'read_verilog -formal bug_evalreg.v; synth; write_verilog -noattr syn_bug_evalreg_yosys.v'

iverilog -o main comb1.v
./main
