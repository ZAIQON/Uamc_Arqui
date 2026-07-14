library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2a1_8 is
    Port ( I0, I1 : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC; O : out STD_LOGIC_VECTOR(7 downto 0));
end Mux2a1_8;
architecture Booleana of Mux2a1_8 is
begin
    O(0) <= (I0(0) and not S) or (I1(0) and S);
    O(1) <= (I0(1) and not S) or (I1(1) and S);
    O(2) <= (I0(2) and not S) or (I1(2) and S);
    O(3) <= (I0(3) and not S) or (I1(3) and S);
    O(4) <= (I0(4) and not S) or (I1(4) and S);
    O(5) <= (I0(5) and not S) or (I1(5) and S);
    O(6) <= (I0(6) and not S) or (I1(6) and S);
    O(7) <= (I0(7) and not S) or (I1(7) and S);
end Booleana;