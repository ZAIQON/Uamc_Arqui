library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2a1 is
    Port ( I0, I1, S : in STD_LOGIC; O : out STD_LOGIC);
end Mux2a1;
architecture Booleana of Mux2a1 is
begin
    O <= (I0 and not S) or (I1 and S);
end Booleana;