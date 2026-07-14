library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4a1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           I3 : in  STD_LOGIC;
           S  : in  STD_LOGIC_VECTOR(1 downto 0);
           O  : out STD_LOGIC);
end Mux4a1;

architecture Booleana of Mux4a1 is
begin
    O <= (I0 and not S(1) and not S(0)) or
         (I1 and not S(1) and     S(0)) or
         (I2 and     S(1) and not S(0)) or
         (I3 and     S(1) and     S(0));
end Booleana;
