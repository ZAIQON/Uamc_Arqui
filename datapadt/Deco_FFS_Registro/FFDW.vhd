library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFDW is
    Port ( clk : in  STD_LOGIC;
           W   : in  STD_LOGIC;
           D   : in  STD_LOGIC;
           Q   : out STD_LOGIC);
end FFDW;

architecture Estructural of FFDW is
    component FFD is
        Port ( clk, D : in STD_LOGIC; Q : out STD_LOGIC);
    end component;
    signal mux_out, q_feedback : STD_LOGIC;
begin

    mux_out <= (q_feedback and not W) or (D and W);
    
    U_FFD: FFD port map (clk => clk, D => mux_out, Q => q_feedback);
    Q <= q_feedback;
end Estructural;