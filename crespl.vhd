library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- counter with sync clear and pl on rising edge

entity CRESPL is
	generic (N: INTEGER := 8);
	port (C, CLR, PL: in STD_LOGIC;
	DATA: in STD_LOGIC_VECTOR(N - 1 downto 0);
	Q: out STD_LOGIC_VECTOR(N - 1 downto 0));
end CRESPL;

architecture COUNTER of CRESPL is

signal intQ: STD_LOGIC_VECTOR(N - 1 downto 0);

begin
	process (C, CLR, PL, DATA) begin
		if CLR = '1' then
			intQ <= (others => '0');
		elsif PL = '1' then
			intQ <= DATA;
		elsif rising_edge(C) then
			intQ <= intQ + 1;
		end if;
	end process;
	
	Q <= intQ;
	
end COUNTER;
