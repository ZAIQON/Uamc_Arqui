library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter is
    Port ( A   : in  STD_LOGIC_VECTOR(7 downto 0);
           S   : in  STD_LOGIC; 
           Res : out STD_LOGIC_VECTOR(7 downto 0));
end shifter;

architecture Booleana of shifter is
    signal shifted : STD_LOGIC_VECTOR(7 downto 0);
    component Mux2a1_8 is Port ( I0, I1 : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC; O : out STD_LOGIC_VECTOR(7 downto 0)); end component;
begin
    shifted(0) <= '0';
    shifted(1) <= A(0);
    shifted(2) <= A(1);
    shifted(3) <= A(2);
    shifted(4) <= A(3);
    shifted(5) <= A(4);
    shifted(6) <= A(5);
    shifted(7) <= A(6);

    MUX: Mux2a1_8 port map (I0 => A, I1 => shifted, S => S, O => Res);
end Booleana;