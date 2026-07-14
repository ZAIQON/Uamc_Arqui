library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8a1_8 is
    Port ( I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR(7 downto 0);
           S : in STD_LOGIC_VECTOR(2 downto 0);
           O : out STD_LOGIC_VECTOR(7 downto 0));
end Mux8a1_8;

architecture Booleana of Mux8a1_8 is
    signal sel0, sel1, sel2, sel3, sel4, sel5, sel6, sel7 : STD_LOGIC;
begin
    sel0 <= not S(2) and not S(1) and not S(0);
    sel1 <= not S(2) and not S(1) and     S(0);
    sel2 <= not S(2) and     S(1) and not S(0);
    sel3 <= not S(2) and     S(1) and     S(0);
    sel4 <=     S(2) and not S(1) and not S(0);
    sel5 <=     S(2) and not S(1) and     S(0);
    sel6 <=     S(2) and     S(1) and not S(0);
    sel7 <=     S(2) and     S(1) and     S(0);

    O(0) <= (I0(0) and sel0) or (I1(0) and sel1) or (I2(0) and sel2) or (I3(0) and sel3) or (I4(0) and sel4) or (I5(0) and sel5) or (I6(0) and sel6) or (I7(0) and sel7);
    O(1) <= (I0(1) and sel0) or (I1(1) and sel1) or (I2(1) and sel2) or (I3(1) and sel3) or (I4(1) and sel4) or (I5(1) and sel5) or (I6(1) and sel6) or (I7(1) and sel7);
    O(2) <= (I0(2) and sel0) or (I1(2) and sel1) or (I2(2) and sel2) or (I3(2) and sel3) or (I4(2) and sel4) or (I5(2) and sel5) or (I6(2) and sel6) or (I7(2) and sel7);
    O(3) <= (I0(3) and sel0) or (I1(3) and sel1) or (I2(3) and sel2) or (I3(3) and sel3) or (I4(3) and sel4) or (I5(3) and sel5) or (I6(3) and sel6) or (I7(3) and sel7);
    O(4) <= (I0(4) and sel0) or (I1(4) and sel1) or (I2(4) and sel2) or (I3(4) and sel3) or (I4(4) and sel4) or (I5(4) and sel5) or (I6(4) and sel6) or (I7(4) and sel7);
    O(5) <= (I0(5) and sel0) or (I1(5) and sel1) or (I2(5) and sel2) or (I3(5) and sel3) or (I4(5) and sel4) or (I5(5) and sel5) or (I6(5) and sel6) or (I7(5) and sel7);
    O(6) <= (I0(6) and sel0) or (I1(6) and sel1) or (I2(6) and sel2) or (I3(6) and sel3) or (I4(6) and sel4) or (I5(6) and sel5) or (I6(6) and sel6) or (I7(6) and sel7);
    O(7) <= (I0(7) and sel0) or (I1(7) and sel1) or (I2(7) and sel2) or (I3(7) and sel3) or (I4(7) and sel4) or (I5(7) and sel5) or (I6(7) and sel6) or (I7(7) and sel7);
end Booleana;