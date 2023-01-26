library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity instructionmemory_tb is
end instructionmemory_tb;

architecture TB_ARCHITECTURE of instructionmemory_tb is
	-- Component declaration of the tested unit
	component instructionmemory
	port(
		addr : in STD_LOGIC_VECTOR(3 downto 0);
		readr1 : out STD_LOGIC_VECTOR(1 downto 0);
		readr2 : out STD_LOGIC_VECTOR(1 downto 0);
		writer : out STD_LOGIC_VECTOR(1 downto 0);
		op : out STD_LOGIC_VECTOR(1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal addr : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal readr1 : STD_LOGIC_VECTOR(1 downto 0);
	signal readr2 : STD_LOGIC_VECTOR(1 downto 0);
	signal writer : STD_LOGIC_VECTOR(1 downto 0);
	signal op : STD_LOGIC_VECTOR(1 downto 0);

	-- Add your code here ...  
	constant period: time := 50 ns;

begin

	-- Unit Under Test port map
	UUT : instructionmemory
		port map (
			addr => addr,
			readr1 => readr1,
			readr2 => readr2,
			writer => writer,
			op => op
		);

	-- Add your stimulus here ... 
	process
	begin
		addr<="0000";
		wait for period; 
		addr<="0011";
		wait for period;
		addr<="1001";
		wait for period;
		addr<="1000";
		wait for period;
		addr<="1111";
		wait for period;
		addr<="1010";
		wait for period;
		addr<="0101";
		wait for period;
		addr<="0111";
		wait for period;
		addr<="0110";
		wait for period;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_instructionmemory of instructionmemory_tb is
	for TB_ARCHITECTURE
		for UUT : instructionmemory
			use entity work.instructionmemory(instructionmemory_behave);
		end for;
	end for;
end TESTBENCH_FOR_instructionmemory;

