library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro8Bits is
    Port ( clk : in  STD_LOGIC;
           W   : in  STD_LOGIC;
           D   : in  STD_LOGIC_VECTOR(7 downto 0);
           Q   : out STD_LOGIC_VECTOR(7 downto 0));
end Registro8Bits;

architecture Estructural of Registro8Bits is
    component FFDW is
        Port ( clk, W, D : in STD_LOGIC; Q : out STD_LOGIC);
    end component;
begin
    Bit0: FFDW port map (clk => clk, W => W, D => D(0), Q => Q(0));
    Bit1: FFDW port map (clk => clk, W => W, D => D(1), Q => Q(1));
    Bit2: FFDW port map (clk => clk, W => W, D => D(2), Q => Q(2));
    Bit3: FFDW port map (clk => clk, W => W, D => D(3), Q => Q(3));
    Bit4: FFDW port map (clk => clk, W => W, D => D(4), Q => Q(4));
    Bit5: FFDW port map (clk => clk, W => W, D => D(5), Q => Q(5));
    Bit6: FFDW port map (clk => clk, W => W, D => D(6), Q => Q(6));
    Bit7: FFDW port map (clk => clk, W => W, D => D(7), Q => Q(7));
end Estructural;