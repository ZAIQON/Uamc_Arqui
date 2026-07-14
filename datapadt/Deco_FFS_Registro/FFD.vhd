library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFD is
    Port ( clk : in  STD_LOGIC;
           D   : in  STD_LOGIC;
           Q   : out STD_LOGIC);
end FFD;

architecture Sincrona of FFD is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            Q <= D;
        end if;
    end process;
end Sincrona;