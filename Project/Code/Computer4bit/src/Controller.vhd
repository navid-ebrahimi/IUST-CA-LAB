library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------
-- number of registers: 4 - 2 bits 
-- memory of every register: 2 bytes - 4 bits
-- number of instructions: 16 - 4 bits	
-- length of every instruction: 8 bit (writer 2bits / readr1 2bits / readr2 2bits / op code 2bits)
---------------------------------------------------------------------------
-- This is the top module. The main Testbench will be run using this entity.
-- Some dbg signals are defined to see the signals inside the entity and see 
-- 	   the input and output values of components
entity Controller is
	port(
	reset: in std_logic;
	clk: in std_logic; 
	dbg_counter: out std_logic_vector(3 downto 0);
	dbg_im_readr1: out std_logic_vector(1 downto 0);
	dbg_im_readr2: out std_logic_vector(1 downto 0);
	dbg_im_writer: out std_logic_vector(1 downto 0);
	dbg_im_op: out std_logic_vector(1 downto 0);
	dbg_rf_readd1: out std_logic_vector(3 downto 0);
	dbg_rf_readd2: out std_logic_vector(3 downto 0);  
	dbg_alu_result: out std_logic_vector(3 downto 0)
	);
end Controller;

architecture Controller_behave of Controller is				  
component ALU is 
	port(
	opnd1: in std_logic_vector(3 downto 0);
	opnd2: in std_logic_vector(3 downto 0);
	op: in std_logic_vector(1 downto 0);
	result: out std_logic_vector(3 downto 0)
	);
end component;

component InstructionMemory is
	port(
	addr: in std_logic_vector(3 downto 0);
	readr1: out std_logic_vector(1 downto 0);
	readr2: out std_logic_vector(1 downto 0);
	writer: out std_logic_vector(1 downto 0);  
	op: out std_logic_vector(1 downto 0)
	);									
end component;


component PC is 
	port(
	input: in std_logic_vector(3 downto 0);	
	clk: in std_logic;
	output: out std_logic_vector(3 downto 0)
	);
end component;

component RegisterFile is 			  
	port(
	readr1: in std_logic_vector(1 downto 0);
	readr2: in std_logic_vector(1 downto 0);
	writer: in std_logic_vector(1 downto 0);
	writed: in std_logic_vector(3 downto 0); 
	regwrite: in std_logic;
	readd1: out std_logic_vector(3 downto 0);
	readd2: out std_logic_vector(3 downto 0)
	);
end component;	

-- ALU signals
signal alu_opnd1:std_logic_vector(3 downto 0);
signal alu_opnd2:std_logic_vector(3 downto 0);
signal alu_op: std_logic_vector(1 downto 0);
signal alu_result: std_logic_vector(3 downto 0);

-- InstructionMemory signals
signal im_addr: std_logic_vector(3 downto 0);
signal im_readr1: std_logic_vector(1 downto 0);
signal im_readr2: std_logic_vector(1 downto 0);
signal im_writer: std_logic_vector(1 downto 0);  
signal im_op: std_logic_vector(1 downto 0);

-- PC signals
signal pc_input: std_logic_vector(3 downto 0);	
signal pc_clk: std_logic;
signal pc_output: std_logic_vector(3 downto 0);

-- RegisterFile signals
signal rf_readr1: std_logic_vector(1 downto 0);
signal rf_readr2: std_logic_vector(1 downto 0);
signal rf_writer: std_logic_vector(1 downto 0);
signal rf_writed: std_logic_vector(3 downto 0); 
signal rf_regwrite: std_logic;
signal rf_readd1: std_logic_vector(3 downto 0);
signal rf_readd2: std_logic_vector(3 downto 0);
signal counter: std_logic_vector(3 downto 0) := "0000";


begin			
	pccom: PC port map(pc_input, pc_clk, pc_output);
	alucom: ALU port map(alu_opnd1, alu_opnd2, alu_op, alu_result);
	imcom: InstructionMemory port map(im_addr, im_readr1, im_readr2, im_writer, im_op);
	rfcom: RegisterFile port map(rf_readr1, rf_readr2, rf_writer, rf_writed, rf_regwrite, rf_readd1, rf_readd2);
	pc_clk <= clk;
	im_addr <= counter;
	rf_readr1 <= im_readr1;
	rf_readr2 <= im_readr2;
	rf_writer <= im_writer;
	alu_opnd1 <= rf_readd1;
	alu_opnd2 <= rf_readd2;
	alu_op <= im_op;   
	rf_writed <= alu_result;
	
	
	dbg_counter <= counter;
	dbg_im_readr1 <= im_readr1;	
	dbg_im_readr2 <= im_readr2;
	dbg_im_writer <= im_writer;
	dbg_im_op <= im_op;
	dbg_rf_readd1 <= rf_readd1; 
	dbg_rf_readd2 <= rf_readd2; 
	dbg_alu_result <= alu_result;	
	process(clk)
	begin 
		if (rising_edge(clk)) then
			if reset = '1' then
				counter <= "0000";
			else
				counter <= std_logic_vector(unsigned(counter) + 1);
				
			end if;
		end if;
	end process;
	
	
end Controller_behave;
