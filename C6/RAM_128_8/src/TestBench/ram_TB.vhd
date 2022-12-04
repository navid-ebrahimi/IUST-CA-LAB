library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity ram_tb is
end ram_tb;

architecture TB_ARCHITECTURE of ram_tb is
	-- Component declaration of the tested unit
	component ram
	port(
		CS : in STD_LOGIC;
		WE : in STD_LOGIC;
		OE : in STD_LOGIC;
		datain : in STD_LOGIC_VECTOR(7 downto 0);
		dataout : out STD_LOGIC_VECTOR(7 downto 0);
		address : in STD_LOGIC_VECTOR(6 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CS : STD_LOGIC;
	signal WE : STD_LOGIC;
	signal OE : STD_LOGIC;
	signal datain : STD_LOGIC_VECTOR(7 downto 0);
	signal address : STD_LOGIC_VECTOR(6 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal dataout : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : ram
		port map (
			CS => CS,
			WE => WE,
			OE => OE,
			datain => datain,
			dataout => dataout,
			address => address
		);

	-- Add your stimulus here ...	
	process
	begin
		CS <= '1';
		datain <= "00000001";
		address <= "0000000";
		OE <= '0';
		WE <= '1';
		wait for 50 ns;	   
		CS <= '1';
		--datain <= "00000001";
		address <= "0000000";
		OE <= '1';
		WE <= '0';
		wait for 50 ns;
		CS <= '1';
		datain <= "00000011";
		address <= "0000010";
		OE <= '0';
		WE <= '1';
		wait for 50 ns;
		CS <= '1';
		--datain <= "00000010";
		address <= "0000010";
		OE <= '1';
		WE <= '0';
		wait for 50 ns;
	end process;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_ram of ram_tb is
	for TB_ARCHITECTURE
		for UUT : ram
			use entity work.ram(ram_behave);
		end for;
	end for;
end TESTBENCH_FOR_ram;

