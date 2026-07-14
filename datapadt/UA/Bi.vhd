library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bi is
    Port ( B     : in  STD_LOGIC_VECTOR(7 downto 0);
           Sel   : in  STD_LOGIC_VECTOR(1 downto 0);
           B_mod : out STD_LOGIC_VECTOR(7 downto 0));
end Bi;

architecture Booleana of Bi is
    component Mux4a1_8 is
        Port ( I0, I1, I2, I3 : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC_VECTOR(1 downto 0); O : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    signal b_inv : STD_LOGIC_VECTOR(7 downto 0);
begin
    b_inv <= not B;

    MUX: Mux4a1_8 port map (
        I0 => B,
        I1 => b_inv,
        I2 => "00000000",
        I3 => "11111111",
        S => Sel,
        O => B_mod
    );
end Booleana;
