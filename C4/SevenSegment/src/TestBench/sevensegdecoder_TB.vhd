library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity sevensegdecoder_tb is
end sevensegdecoder_tb;

architecture TB_ARCHITECTURE of sevensegdecoder_tb is
	-- Component declaration of the tested unit
	component sevensegdecoder
	port(
		A : in STD_LOGIC_VECTOR(3 downto 0);
		O : out STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal O : STD_LOGIC_VECTOR(6 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : sevensegdecoder
		port map (
			A => A,
			O => O
		);

	-- Add your stimulus here ...
	process 
	begin	 
		A <= "0001";
		wait for 50 ns;		 
		A <= "0010";
		wait for 50 ns;
		A <= "0011";
		wait for 50 ns;
		A <= "0100";
		wait for 50 ns;
		A <= "0101";
		wait for 50 ns;
		A <= "0110";
		wait for 50 ns;
		A <= "0111";
		wait for 50 ns;
		A <= "1000";
		wait for 50 ns;
		A <= "1001";
		wait for 50 ns;
		A <= "1010";
		wait for 50 ns;
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sevensegdecoder of sevensegdecoder_tb is
	for TB_ARCHITECTURE
		for UUT : sevensegdecoder
			use entity work.sevensegdecoder(sevensegdecoder_behave);
		end for;
	end for;
end TESTBENCH_FOR_sevensegdecoder;

