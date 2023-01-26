library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity pc_tb is
end pc_tb;

architecture TB_ARCHITECTURE of pc_tb is
	-- Component declaration of the tested unit
	component pc
	port(
		input : in STD_LOGIC_VECTOR(3 downto 0);
		clk : in STD_LOGIC;
		output : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(3 downto 0);
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...
	constant hfperiod: time := 25 ns;

begin

	-- Unit Under Test port map
	UUT : pc
		port map (
			input => input,
			clk => clk,
			output => output
		);

	-- Add your stimulus here ...
	process 
	begin
		wait for hfperiod;
		clk <= '0';
		wait for hfperiod;
		clk <= '1';
	end process;	 
	process
	begin
		input <= "0001";
		wait for 40 ns;
		input <= "0100";
		wait for 70 ns;
		input <= "0110";
		wait for 10 ns;
		input <= "0101";
		wait for 30 ns;
		input <= "0001";
		wait for 20 ns;
		input <= "0000";
		wait for 30 ns;
		input <= "1100";
		wait for 40 ns;
		input <= "1100";
		wait for 20 ns;
		input <= "0011";
		wait for 30 ns;
		input <= "0011";
		wait for 30 ns;
		input <= "0110";
		wait for 30 ns;
		input <= "1001";
		wait for 20 ns;
		input <= "0101";
		wait for 20 ns;
		input <= "1001";
		wait for 60 ns;
		input <= "1001";
		wait for 40 ns;
		input <= "0001";
		wait for 20 ns;
	end process;
	
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_pc of pc_tb is
	for TB_ARCHITECTURE
		for UUT : pc
			use entity work.pc(pc_behave);
		end for;
	end for;
end TESTBENCH_FOR_pc;

