library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_10bits is
    Port ( 
        clk : in  STD_LOGIC;
        D   : in  STD_LOGIC_VECTOR(9 downto 0);
        Q   : out STD_LOGIC_VECTOR(9 downto 0)
    );
end Reg_10bits;

architecture Estructural of Reg_10bits is
    -- Traemos tu Flip-Flop de 1 bit original
    component FFD is
        Port ( clk : in STD_LOGIC; D : in STD_LOGIC; Q : out STD_LOGIC );
    end component;
begin
    -- Ponemos 10 Flip-Flops en fila, uno para cada cable del bus
    bit0: FFD port map ( clk => clk, D => D(0), Q => Q(0) );
    bit1: FFD port map ( clk => clk, D => D(1), Q => Q(1) );
    bit2: FFD port map ( clk => clk, D => D(2), Q => Q(2) );
    bit3: FFD port map ( clk => clk, D => D(3), Q => Q(3) );
    bit4: FFD port map ( clk => clk, D => D(4), Q => Q(4) );
    bit5: FFD port map ( clk => clk, D => D(5), Q => Q(5) );
    bit6: FFD port map ( clk => clk, D => D(6), Q => Q(6) );
    bit7: FFD port map ( clk => clk, D => D(7), Q => Q(7) );
    bit8: FFD port map ( clk => clk, D => D(8), Q => Q(8) );
    bit9: FFD port map ( clk => clk, D => D(9), Q => Q(9) );
end Estructural;