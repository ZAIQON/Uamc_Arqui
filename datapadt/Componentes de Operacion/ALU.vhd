library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( A, B   : in  STD_LOGIC_VECTOR(7 downto 0);
           S      : in  STD_LOGIC_VECTOR(3 downto 0);
           Res    : out STD_LOGIC_VECTOR(7 downto 0);
           Cout_A : out STD_LOGIC;
           V_A    : out STD_LOGIC);
end ALU;

architecture Estructural of ALU is
    component UA is Port ( A, B : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC_VECTOR(2 downto 0); Res : out STD_LOGIC_VECTOR(7 downto 0); Cout, V : out STD_LOGIC); end component;
    component UL is Port ( A, B : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC_VECTOR(1 downto 0); Res : out STD_LOGIC_VECTOR(7 downto 0)); end component;
    component Mux2a1_8 is Port ( I0, I1 : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC; O : out STD_LOGIC_VECTOR(7 downto 0)); end component;

    signal res_ua, res_ul : STD_LOGIC_VECTOR(7 downto 0);
begin
    U_ARIT: UA port map (A => A, B => B, S => S(2 downto 0), Res => res_ua, Cout => Cout_A, V => V_A);
    U_LOGI: UL port map (A => A, B => B, S => S(1 downto 0), Res => res_ul);
    
    MUX_ALU: Mux2a1_8 port map (I0 => res_ua, I1 => res_ul, S => S(3), O => Res);
end Estructural;