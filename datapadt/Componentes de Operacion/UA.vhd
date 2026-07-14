library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UA is
    Port ( A, B  : in  STD_LOGIC_VECTOR(7 downto 0);
           S     : in  STD_LOGIC_VECTOR(2 downto 0);
           Res   : out STD_LOGIC_VECTOR(7 downto 0);
           Cout  : out STD_LOGIC;
           V     : out STD_LOGIC);
end UA;

architecture Estructural of UA is
    component Ai is Port ( A : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC; A_mod : out STD_LOGIC_VECTOR(7 downto 0)); end component;
    component Bi is Port ( B : in STD_LOGIC_VECTOR(7 downto 0); Sel : in STD_LOGIC_VECTOR(1 downto 0); B_mod : out STD_LOGIC_VECTOR(7 downto 0)); end component;
    component Ci is Port ( S : in STD_LOGIC_VECTOR(1 downto 0); Cin : out STD_LOGIC); end component;
    component Sumador8Bits is Port ( A, B : in STD_LOGIC_VECTOR(7 downto 0); Cin : in STD_LOGIC; Sum : out STD_LOGIC_VECTOR(7 downto 0); Cout, V : out STD_LOGIC); end component;

    signal mod_A, mod_B : STD_LOGIC_VECTOR(7 downto 0);
    signal carry_in : STD_LOGIC;
begin
    Inst_A : Ai port map (A => A, S => S(2), A_mod => mod_A);
    Inst_B : Bi port map (B => B, Sel => S(1 downto 0), B_mod => mod_B);
    Inst_C : Ci port map (S => S(1 downto 0), Cin => carry_in);
    
    SUMATORIA: Sumador8Bits port map (A => mod_A, B => mod_B, Cin => carry_in, Sum => Res, Cout => Cout, V => V);
end Estructural;