library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- data register with synchrounous reset and pl, rising edge clock

entity DRFESPL is
	generic (N: INTEGER := 8);
	port (C, CLR, PL: in STD_LOGIC;
	DATA: in STD_LOGIC_VECTOR(N - 1 downto 0);
	Q: out STD_LOGIC_VECTOR(N - 1 downto 0));
end DRFESPL;

architecture DRFESPL of DRFESPL is

signal Q_INT: STD_LOGIC_VECTOR(N - 1 downto 0);

begin
	
	process (C) begin
		if rising_edge(C) then
			if CLR = '1' then
				Q_INT <= (others => '0');
			elsif PL = '1' then
				Q_INT <= DATA;
			end if;
		end if;
	end process;
	
	Q <= Q_INT;
	
end DRFESPL;