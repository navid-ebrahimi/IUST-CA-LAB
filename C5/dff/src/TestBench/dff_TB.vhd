library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity dff_tb is
end dff_tb;

architecture TB_ARCHITECTURE of dff_tb is
	-- Component declaration of the tested unit
	component dff
	port(
		D : in STD_LOGIC;
		Q : out STD_LOGIC;
		Qp : out STD_LOGIC;
		CLK : in STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal D : STD_LOGIC;
	signal CLK : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Q : STD_LOGIC;
	signal Qp : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : dff
		port map (
			D => D,
			Q => Q,
			Qp => Qp,
			CLK => CLK
		);

	-- Add your stimulus here ...  
	--process
--	begin
--		CLK <= not CLK;
--		wait for 50ns;
--	end process; 
	process
	begin
	    CLK <= '0';
	    wait for 50 NS;
	    CLK <= '1';
	    wait for 50 NS;
	end process;
	
	process
	begin
		D <= '1';
		wait for 20ns;
		D <= '0';
		wait for 70ns;
		D <= '1';
		wait for 10ns;
		D <= '0';  
		wait for 100ns;
		D <= '1';
		wait for 50ns;
	end process;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_dff of dff_tb is
	for TB_ARCHITECTURE
		for UUT : dff
			use entity work.dff(dff_arch);
		end for;
	end for;
end TESTBENCH_FOR_dff;

