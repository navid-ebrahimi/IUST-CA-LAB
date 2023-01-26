SetActiveLib -work
comp -include "$dsn\src\Controller.vhd" 
comp -include "$dsn\src\TestBench\controller_TB.vhd" 
asim +access +r TESTBENCH_FOR_controller 
wave 
wave -noreg reset
wave -noreg clk
wave -noreg dbg_counter
wave -noreg dbg_im_readr1
wave -noreg dbg_im_readr2
wave -noreg dbg_im_writer
wave -noreg dbg_im_op
wave -noreg dbg_rf_readd1
wave -noreg dbg_rf_readd2
wave -noreg dbg_alu_result
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\controller_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_controller 
