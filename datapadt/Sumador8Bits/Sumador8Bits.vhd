library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sumador8Bits is
    Port ( A    : in  STD_LOGIC_VECTOR(7 downto 0);
           B    : in  STD_LOGIC_VECTOR(7 downto 0);
           Cin  : in  STD_LOGIC;
           Sum  : out STD_LOGIC_VECTOR(7 downto 0);
           Cout : out STD_LOGIC;
           V    : out STD_LOGIC);
end Sumador8Bits;

architecture Estructural of Sumador8Bits is
    component FA is
        Port ( A, B, Cin : in STD_LOGIC; Sum, Cout : out STD_LOGIC);
    end component;
    signal c : STD_LOGIC_VECTOR(7 downto 0);
begin
    Bit0: FA port map (A => A(0), B => B(0), Cin => Cin,  Sum => Sum(0), Cout => c(0));
    Bit1: FA port map (A => A(1), B => B(1), Cin => c(0), Sum => Sum(1), Cout => c(1));
    Bit2: FA port map (A => A(2), B => B(2), Cin => c(1), Sum => Sum(2), Cout => c(2));
    Bit3: FA port map (A => A(3), B => B(3), Cin => c(2), Sum => Sum(3), Cout => c(3));
    Bit4: FA port map (A => A(4), B => B(4), Cin => c(3), Sum => Sum(4), Cout => c(4));
    Bit5: FA port map (A => A(5), B => B(5), Cin => c(4), Sum => Sum(5), Cout => c(5));
    Bit6: FA port map (A => A(6), B => B(6), Cin => c(5), Sum => Sum(6), Cout => c(6));
    Bit7: FA port map (A => A(7), B => B(7), Cin => c(6), Sum => Sum(7), Cout => c(7));

    Cout <= c(7);
    V    <= c(7) xor c(6);
end Estructural;