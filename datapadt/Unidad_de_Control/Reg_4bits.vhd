library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_4bits is
    Port ( 
        clk : in  STD_LOGIC;
        D   : in  STD_LOGIC_VECTOR(3 downto 0);
        Q   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Reg_4bits;

architecture Estructural of Reg_4bits is
    -- Traemos el FF de 1 bit 
    component FFD is
        Port ( clk : in STD_LOGIC; D : in STD_LOGIC; Q : out STD_LOGIC );
    end component;
begin
   
    bit0: FFD port map ( clk => clk, D => D(0), Q => Q(0) );
    bit1: FFD port map ( clk => clk, D => D(1), Q => Q(1) );
    bit2: FFD port map ( clk => clk, D => D(2), Q => Q(2) );
    bit3: FFD port map ( clk => clk, D => D(3), Q => Q(3) );
end Estructural;