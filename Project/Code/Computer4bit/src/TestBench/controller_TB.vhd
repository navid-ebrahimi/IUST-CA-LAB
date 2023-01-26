library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity controller_tb is
end controller_tb;

architecture TB_ARCHITECTURE of controller_tb is
	-- Component declaration of the tested unit
	component controller
	port(
		reset : in STD_LOGIC;
		clk : in STD_LOGIC;
		dbg_counter : out STD_LOGIC_VECTOR(3 downto 0);
		dbg_im_readr1 : out STD_LOGIC_VECTOR(1 downto 0);
		dbg_im_readr2 : out STD_LOGIC_VECTOR(1 downto 0);
		dbg_im_writer : out STD_LOGIC_VECTOR(1 downto 0);
		dbg_im_op : out STD_LOGIC_VECTOR(1 downto 0);
		dbg_rf_readd1 : out STD_LOGIC_VECTOR(3 downto 0);
		dbg_rf_readd2 : out STD_LOGIC_VECTOR(3 downto 0);
		dbg_alu_result : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal reset : STD_LOGIC;
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal dbg_counter : STD_LOGIC_VECTOR(3 downto 0);
	signal dbg_im_readr1 : STD_LOGIC_VECTOR(1 downto 0);
	signal dbg_im_readr2 : STD_LOGIC_VECTOR(1 downto 0);
	signal dbg_im_writer : STD_LOGIC_VECTOR(1 downto 0);
	signal dbg_im_op : STD_LOGIC_VECTOR(1 downto 0);
	signal dbg_rf_readd1 : STD_LOGIC_VECTOR(3 downto 0);
	signal dbg_rf_readd2 : STD_LOGIC_VECTOR(3 downto 0);
	signal dbg_alu_result : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : controller
		port map (
			reset => reset,
			clk => clk,
			dbg_counter => dbg_counter,
			dbg_im_readr1 => dbg_im_readr1,
			dbg_im_readr2 => dbg_im_readr2,
			dbg_im_writer => dbg_im_writer,
			dbg_im_op => dbg_im_op,
			dbg_rf_readd1 => dbg_rf_readd1,
			dbg_rf_readd2 => dbg_rf_readd2,
			dbg_alu_result => dbg_alu_result
		);

	-- Add your stimulus here ...
	process
	begin
		clk <= '0';
		wait for 25 ns;
		clk <= '1';
		wait for 25 ns;
	end process;
	
	process
	begin
		reset <= '1';
		wait for 10 ns;
		reset <= '0';
		wait for 1000 ns;
	end process;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_controller of controller_tb is
	for TB_ARCHITECTURE
		for UUT : controller
			use entity work.controller(controller_behave);
		end for;
	end for;
end TESTBENCH_FOR_controller;

