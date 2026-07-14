library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4a1_8 is
    Port ( I0 : in  STD_LOGIC_VECTOR(7 downto 0);
           I1 : in  STD_LOGIC_VECTOR(7 downto 0);
           I2 : in  STD_LOGIC_VECTOR(7 downto 0);
           I3 : in  STD_LOGIC_VECTOR(7 downto 0);
           S  : in  STD_LOGIC_VECTOR(1 downto 0);
           O  : out STD_LOGIC_VECTOR(7 downto 0));
end Mux4a1_8;

architecture Booleana of Mux4a1_8 is
begin
    O(0) <= (I0(0) and not S(1) and not S(0)) or (I1(0) and not S(1) and S(0)) or (I2(0) and S(1) and not S(0)) or (I3(0) and S(1) and S(0));
    O(1) <= (I0(1) and not S(1) and not S(0)) or (I1(1) and not S(1) and S(0)) or (I2(1) and S(1) and not S(0)) or (I3(1) and S(1) and S(0));
    O(2) <= (I0(2) and not S(1) and not S(0)) or (I1(2) and not S(1) and S(0)) or (I2(2) and S(1) and not S(0)) or (I3(2) and S(1) and S(0));
    O(3) <= (I0(3) and not S(1) and not S(0)) or (I1(3) and not S(1) and S(0)) or (I2(3) and S(1) and not S(0)) or (I3(3) and S(1) and S(0));
    O(4) <= (I0(4) and not S(1) and not S(0)) or (I1(4) and not S(1) and S(0)) or (I2(4) and S(1) and not S(0)) or (I3(4) and S(1) and S(0));
    O(5) <= (I0(5) and not S(1) and not S(0)) or (I1(5) and not S(1) and S(0)) or (I2(5) and S(1) and not S(0)) or (I3(5) and S(1) and S(0));
    O(6) <= (I0(6) and not S(1) and not S(0)) or (I1(6) and not S(1) and S(0)) or (I2(6) and S(1) and not S(0)) or (I3(6) and S(1) and S(0));
    O(7) <= (I0(7) and not S(1) and not S(0)) or (I1(7) and not S(1) and S(0)) or (I2(7) and S(1) and not S(0)) or (I3(7) and S(1) and S(0));
end Booleana;