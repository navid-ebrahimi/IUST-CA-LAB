library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity ha_tb is
end ha_tb;

architecture TB_ARCHITECTURE of ha_tb is
	-- Component declaration of the tested unit
	component ha
	port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		Sum : out STD_LOGIC;
		C : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC;
	signal B : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Sum : STD_LOGIC;
	signal C : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : ha
		port map (
			A => A,
			B => B,
			Sum => Sum,
			C => C
		);

	process
	begin		   
		A <= '0';
		B <= '1';
		wait for 50 ns;
		A <= '1';
		B <= '0';
		wait for 50 ns;
		A <= '0';
		B <= '0';
		wait for 50 ns;
		A <= '1';
		B <= '1';
		wait for 50 ns;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_ha of ha_tb is
	for TB_ARCHITECTURE
		for UUT : ha
			use entity work.ha(ha_arc);
		end for;
	end for;
end TESTBENCH_FOR_ha;

