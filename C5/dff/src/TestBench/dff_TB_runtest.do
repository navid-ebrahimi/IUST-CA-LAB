SetActiveLib -work
comp -include "$dsn\src\dff.vhd" 
comp -include "$dsn\src\TestBench\dff_TB.vhd" 
asim +access +r TESTBENCH_FOR_dff 
wave 
wave -noreg D
wave -noreg Q
wave -noreg Qp
wave -noreg CLK
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\dff_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_dff 
