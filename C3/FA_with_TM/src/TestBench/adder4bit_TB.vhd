library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity adder4bit_tb is
end adder4bit_tb;

architecture TB_ARCHITECTURE of adder4bit_tb is
	-- Component declaration of the tested unit
	component adder4bit
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
	UUT : adder4bit
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
		A <= "0011";
		B <= "0001";
		cin <= '1';
		wait for 50 ns;	
		A <= "0101";
		B <= "0010";
		cin <= '1';
		wait for 50 ns;
		A <= "1000";
		B <= "0001";
		cin <= '0';
		wait for 50 ns;
		A <= "1001";
		B <= "0100";
		cin <= '0';
		wait for 50 ns;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_adder4bit of adder4bit_tb is
	for TB_ARCHITECTURE
		for UUT : adder4bit
			use entity work.adder4bit(adder_behave);
		end for;
	end for;
end TESTBENCH_FOR_adder4bit;

