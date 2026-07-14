library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UL is
    Port ( A, B : in  STD_LOGIC_VECTOR(7 downto 0);
           S    : in  STD_LOGIC_VECTOR(1 downto 0);
           Res  : out STD_LOGIC_VECTOR(7 downto 0));
end UL;

architecture Booleana of UL is
    signal op_and, op_or, op_xor, op_not : STD_LOGIC_VECTOR(7 downto 0);
    component Mux4a1_8 is Port ( I0, I1, I2, I3 : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC_VECTOR(1 downto 0); O : out STD_LOGIC_VECTOR(7 downto 0)); end component;
begin
    op_and <= A and B;
    op_or  <= A or B;
    op_xor <= A xor B;
    op_not <= not A;


    MUX: Mux4a1_8 port map (I0 => op_and, I1 => op_or, I2 => op_xor, I3 => op_not, S => S, O => Res);
end Booleana;