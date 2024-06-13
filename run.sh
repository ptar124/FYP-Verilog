#sed 's/top/top_1/' rtl.v > rtl_yosys.v
#/mnt/c/Users/ptar1/Documents/yosys-yosys-0.8b/yosys-yosys-0.8b/build/yosys -p 'read -formal rtl_yosys.v; synth; write_verilog -noattr syn_yosys.v'
/mnt/c/Users/ptar1/Documents/yosys-yosys-0.8b/yosys-yosys-0.8b/build/yosys -p 'read -formal wrongmsb.v; synth; write_verilog -noattr wrongmsb.v'
yosys -p 'read_verilog -formal rtl_yosys.v; synth; write_verilog -noattr syn_yosys.v'
sby -f proof.sby
iverilog -o main testbench.v

#/mnt/c/Users/ptar1/Documents/yosys-yosys-0.8/yosys-yosys-0.8/build/yosys -p 'read -formal bug_eval.v; synth; write_verilog -noattr syn_bug_eval_yosys.v'
#/mnt/c/Users/ptar1/Documents/yosys-yosys-0.35/yosys-yosys-0.35/build/yosys -p 'read -formal bug_eval1.v; synth; write_verilog -noattr syn_bug_eval1_yosys.v'
#yosys -p 'read_verilog -formal bug_eval2.v; synth; write_verilog -noattr syn_bug_eval2_yosys.v'
yosys -p 'read_verilog -formal bug_eval_combined.v; synth; write_verilog -noattr syn_bug_eval_combined.v'
#yosys -p 'read_verilog -formal bug_evalreg.v; synth; write_verilog -noattr syn_bug_evalreg_yosys.v'

iverilog -o main comb1.v
./main
