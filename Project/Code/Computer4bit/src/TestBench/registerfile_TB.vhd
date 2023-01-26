library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity registerfile_tb is
end registerfile_tb;

architecture TB_ARCHITECTURE of registerfile_tb is
	-- Component declaration of the tested unit
	component registerfile
	port(
		readr1 : in STD_LOGIC_VECTOR(1 downto 0);
		readr2 : in STD_LOGIC_VECTOR(1 downto 0);
		writer : in STD_LOGIC_VECTOR(1 downto 0);
		writed : in STD_LOGIC_VECTOR(3 downto 0);
		regwrite : in STD_LOGIC;
		readd1 : out STD_LOGIC_VECTOR(3 downto 0);
		readd2 : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal readr1 : STD_LOGIC_VECTOR(1 downto 0);
	signal readr2 : STD_LOGIC_VECTOR(1 downto 0);
	signal writer : STD_LOGIC_VECTOR(1 downto 0);
	signal writed : STD_LOGIC_VECTOR(3 downto 0);
	signal regwrite : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal readd1 : STD_LOGIC_VECTOR(3 downto 0);
	signal readd2 : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...  
	constant period: time := 49 ns;
	constant pulseperiod: time := 1ns;	  
begin

	-- Unit Under Test port map
	UUT : registerfile
		port map (
			readr1 => readr1,
			readr2 => readr2,
			writer => writer,
			writed => writed,
			regwrite => regwrite,
			readd1 => readd1,
			readd2 => readd2
		);

	-- Add your stimulus here ...  
	
	process
	begin	
		-- initialize regwrite
		regwrite <= '0';
		-- check read from registers
		readr1 <= "00";
		readr2 <= "01";
		wait for period;  
		
		readr1 <= "10";
		readr2 <= "00";
		wait for period;
		
		readr1 <= "11";
		readr2 <= "10";
		wait for period;
		
		--check write to registers
		writer <= "00";
		writed <= "1000";
		regwrite <= '1';
		wait for pulseperiod;
		regwrite <= '0';
		wait for period; 
		
		writer <= "01";
		writed <= "1001";
		regwrite <= '1';
		wait for pulseperiod;
		regwrite <= '0';
		wait for period; 
		
		writer <= "10";
		writed <= "1010";
		regwrite <= '1'; 
		wait for pulseperiod;
		regwrite <= '0';
		wait for period;
		
	end process;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_registerfile of registerfile_tb is
	for TB_ARCHITECTURE
		for UUT : registerfile
			use entity work.registerfile(registerfile_behave);
		end for;
	end for;
end TESTBENCH_FOR_registerfile;

