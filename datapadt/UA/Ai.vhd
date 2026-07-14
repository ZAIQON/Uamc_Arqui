library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ai is
    Port ( A     : in  STD_LOGIC_VECTOR(7 downto 0);
           S     : in  STD_LOGIC;
           A_mod : out STD_LOGIC_VECTOR(7 downto 0));
end Ai;

architecture Booleana of Ai is
begin

    A_mod(0) <= A(0) and not S;
    A_mod(1) <= A(1) and not S;
    A_mod(2) <= A(2) and not S;
    A_mod(3) <= A(3) and not S;
    A_mod(4) <= A(4) and not S;
    A_mod(5) <= A(5) and not S;
    A_mod(6) <= A(6) and not S;
    A_mod(7) <= A(7) and not S;
end Booleana;
