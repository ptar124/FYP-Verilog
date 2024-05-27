sed 's/top/top_1/' rtl.v > rtl_yosys.v
/mnt/c/Users/ptar1/Documents/yosys-yosys-0.8b/yosys-yosys-0.8b/build/yosys -p 'read -formal rtl_yosys.v; synth; write_verilog -noattr syn_yosys.v'
sby -f proof.sby
iverilog -o main testbench.v

/mnt/c/Users/ptar1/Documents/yosys-yosys-0.8b/yosys-yosys-0.8b/build/yosys -p 'read -formal bug_eval.v; synth; write_verilog -noattr syn_bug_eval_yosys.v'
iverilog -o main comb1.v
./main
