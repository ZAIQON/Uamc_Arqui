library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8a1 is
    Port ( I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR(2 downto 0);
           O : out STD_LOGIC);
end Mux8a1;

architecture Booleana of Mux8a1 is
begin
    O <= (I0 and not S(2) and not S(1) and not S(0)) or
         (I1 and not S(2) and not S(1) and     S(0)) or
         (I2 and not S(2) and     S(1) and not S(0)) or
         (I3 and not S(2) and     S(1) and     S(0)) or
         (I4 and     S(2) and not S(1) and not S(0)) or
         (I5 and     S(2) and not S(1) and     S(0)) or
         (I6 and     S(2) and     S(1) and not S(0)) or
         (I7 and     S(2) and     S(1) and     S(0));
end Booleana;