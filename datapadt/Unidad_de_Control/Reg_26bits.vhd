library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_26bits is
    Port ( 
        clk : in  STD_LOGIC;
        D   : in  STD_LOGIC_VECTOR(25 downto 0);
        Q   : out STD_LOGIC_VECTOR(25 downto 0)
    );
end Reg_26bits;

architecture Estructural of Reg_26bits is
    -- Traemos el FF de 1 bit 
    component FFD is
        Port ( clk : in STD_LOGIC; D : in STD_LOGIC; Q : out STD_LOGIC );
    end component;
begin
   
    bit0:  FFD port map ( clk => clk, D => D(0),  Q => Q(0)  );
    bit1:  FFD port map ( clk => clk, D => D(1),  Q => Q(1)  );
    bit2:  FFD port map ( clk => clk, D => D(2),  Q => Q(2)  );
    bit3:  FFD port map ( clk => clk, D => D(3),  Q => Q(3)  );
    bit4:  FFD port map ( clk => clk, D => D(4),  Q => Q(4)  );
    bit5:  FFD port map ( clk => clk, D => D(5),  Q => Q(5)  );
    bit6:  FFD port map ( clk => clk, D => D(6),  Q => Q(6)  );
    bit7:  FFD port map ( clk => clk, D => D(7),  Q => Q(7)  );
    bit8:  FFD port map ( clk => clk, D => D(8),  Q => Q(8)  );
    bit9:  FFD port map ( clk => clk, D => D(9),  Q => Q(9)  );
    bit10: FFD port map ( clk => clk, D => D(10), Q => Q(10) );
    bit11: FFD port map ( clk => clk, D => D(11), Q => Q(11) );
    bit12: FFD port map ( clk => clk, D => D(12), Q => Q(12) );
    bit13: FFD port map ( clk => clk, D => D(13), Q => Q(13) );
    bit14: FFD port map ( clk => clk, D => D(14), Q => Q(14) );
    bit15: FFD port map ( clk => clk, D => D(15), Q => Q(15) );
    bit16: FFD port map ( clk => clk, D => D(16), Q => Q(16) );
    bit17: FFD port map ( clk => clk, D => D(17), Q => Q(17) );
    bit18: FFD port map ( clk => clk, D => D(18), Q => Q(18) );
    bit19: FFD port map ( clk => clk, D => D(19), Q => Q(19) );
    bit20: FFD port map ( clk => clk, D => D(20), Q => Q(20) );
    bit21: FFD port map ( clk => clk, D => D(21), Q => Q(21) );
    bit22: FFD port map ( clk => clk, D => D(22), Q => Q(22) );
    bit23: FFD port map ( clk => clk, D => D(23), Q => Q(23) );
    bit24: FFD port map ( clk => clk, D => D(24), Q => Q(24) );
    bit25: FFD port map ( clk => clk, D => D(25), Q => Q(25) );
end Estructural;