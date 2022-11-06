library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity bcdadder_tb is
end bcdadder_tb;

architecture TB_ARCHITECTURE of bcdadder_tb is
	-- Component declaration of the tested unit
	component bcdadder
	port(
		A : in STD_LOGIC_VECTOR(3 downto 0);
		B : in STD_LOGIC_VECTOR(3 downto 0);
		cin : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR(3 downto 0);
		cout : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(3 downto 0);
	signal B : STD_LOGIC_VECTOR(3 downto 0);
	signal cin : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal S : STD_LOGIC_VECTOR(3 downto 0);
	signal cout : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : bcdadder
		port map (
			A => A,
			B => B,
			cin => cin,
			S => S,
			cout => cout
		);

	-- Add your stimulus here ...
	process
	begin	   
		A <= "0101";
		B <= "0110";
		cin <= '0';
		wait for 50 ns;	 
		A <= "0000";
		B <= "0000";
		cin <= '0';
		wait for 50 ns;
		A <= "0001";
		B <= "0010";
		cin <= '0';
		wait for 50 ns;
		A <= "0011";
		B <= "0110";
		cin <= '0';
		wait for 50 ns;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_bcdadder of bcdadder_tb is
	for TB_ARCHITECTURE
		for UUT : bcdadder
			use entity work.bcdadder(bcdadder_arch);
		end for;
	end for;
end TESTBENCH_FOR_bcdadder;

