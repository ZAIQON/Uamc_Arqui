library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ci is
    Port ( S   : in  STD_LOGIC_VECTOR(1 downto 0);
           Cin : out STD_LOGIC);
end Ci;

architecture Booleana of Ci is
begin

    Cin <= S(0) or S(1);
end Booleana;
