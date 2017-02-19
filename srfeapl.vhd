library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- shift register with async clear and pl, falling edge clock

entity SRFEAPL is
	generic ( N: INTEGER := 8 ); 
	port ( C, CE, SI, LEFT, CLR, PL: in STD_LOGIC;
		DATA: in STD_LOGIC_VECTOR(N - 1 downto 0);
		Q: out STD_LOGIC_VECTOR(N - 1 downto 0) );
end SRFEAPL;

architecture SRFEAPL of SRFEAPL is
signal Q_INT: STD_LOGIC_VECTOR(N - 1 downto 0);
begin
	process (C, CLR, PL, DATA)
	begin
		if (CLR = '1') then
			Q_INT <= (others => '0');
		elsif (PL = '1') then
			Q_INT <= DATA;
		elsif (falling_edge(C)) then
			if (CE = '1') then
				if (LEFT = '0') then
					Q_INT <= SI & Q_INT(N - 1 downto 1);
				else
					Q_INT <= Q_INT(N - 2 downto 0) & SI;
				end if;
			end if;
		end if;
	end process;
	
	Q <= Q_INT;
end SRFEAPL;
