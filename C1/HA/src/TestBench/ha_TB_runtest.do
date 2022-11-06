SetActiveLib -work
comp -include "$dsn\src\HA.vhd" 
comp -include "$dsn\src\TestBench\ha_TB.vhd" 
asim +access +r TESTBENCH_FOR_ha 
wave 
wave -noreg A
wave -noreg B
wave -noreg Sum
wave -noreg C
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\ha_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_ha 
