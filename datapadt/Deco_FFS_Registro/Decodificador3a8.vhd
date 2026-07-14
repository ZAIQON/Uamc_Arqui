library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decodificador3a8 is
    Port ( S  : in  STD_LOGIC_VECTOR(2 downto 0);
           En : in  STD_LOGIC;
           O  : out STD_LOGIC_VECTOR(7 downto 0));
end Decodificador3a8;

architecture Booleana of Decodificador3a8 is
begin
    O(0) <= not S(2) and not S(1) and not S(0) and En;
    O(1) <= not S(2) and not S(1) and     S(0) and En;
    O(2) <= not S(2) and     S(1) and not S(0) and En;
    O(3) <= not S(2) and     S(1) and     S(0) and En;
    O(4) <=     S(2) and not S(1) and not S(0) and En;
    O(5) <=     S(2) and not S(1) and     S(0) and En;
    O(6) <=     S(2) and     S(1) and not S(0) and En;
    O(7) <=     S(2) and     S(1) and     S(0) and En;
end Booleana;