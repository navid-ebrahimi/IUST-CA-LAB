library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		opnd1 : in STD_LOGIC_VECTOR(3 downto 0);
		opnd2 : in STD_LOGIC_VECTOR(3 downto 0);
		op : in STD_LOGIC_VECTOR(1 downto 0);
		result : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal opnd1 : STD_LOGIC_VECTOR(3 downto 0);
	signal opnd2 : STD_LOGIC_VECTOR(3 downto 0);
	signal op : STD_LOGIC_VECTOR(1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal result : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ... 
	--signal clk : std_logic := '0';
    constant period : time := 50 ns;

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			opnd1 => opnd1,
			opnd2 => opnd2,
			op => op,
			result => result
		);

	-- Add your stimulus here ...  
	process
	begin
		
		opnd1 <= "0001";
		opnd2 <= "0001";
		op <= "01";
		wait for period;
		opnd1 <= "0111";
		opnd2 <= "0001";
		op <= "01";
		wait for period;
		opnd1 <= "0100";
		opnd2 <= "0101";
		op <= "01";
		wait for period;
		opnd1 <= "0100";
		opnd2 <= "1011";
		op <= "01";
		wait for period;
		opnd1 <= "1111";
		opnd2 <= "1110";
		op <= "01";
		wait for period;
		opnd1 <= "0001";
		opnd2 <= "0001";
		op <= "01";
		wait for period;
		opnd1 <= "1101";
		opnd2 <= "1110";
		op <= "01";
		wait for period;
	end process;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(alu_behave);
		end for;
	end for;
end TESTBENCH_FOR_alu;

