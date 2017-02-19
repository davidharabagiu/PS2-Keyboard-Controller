library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SI_MEM is
   port (C, CLR: in STD_LOGIC;
        DIN : in STD_LOGIC_VECTOR(6 downto 0);
        Q1,Q2,Q3,Q4: out STD_LOGIC_VECTOR(6 downto 0));
end SI_MEM;

architecture Behavioral of SI_MEM is
signal Q1_INT,Q2_INT,Q3_INT,Q4_INT : STD_LOGIC_VECTOR(6 downto 0);
 begin
    process (C, CLR)
    begin
        if CLR = '1' then
            Q1_INT <= (others => '1');
            Q2_INT <= (others => '1');
            Q3_INT <= (others => '1');
            Q4_INT <= (others => '1');
         elsif rising_edge(C) then
            Q4_INT <= Q3_INT;
            Q3_INT <= Q2_INT;
            Q2_INT <= Q1_INT;
            Q1_INT <= DIN;
         end if;
    end process;
    Q1<=Q1_INT;
    Q2<=Q2_INT;
    Q3<=Q3_INT;
    Q4<=Q4_INT;
end Behavioral;