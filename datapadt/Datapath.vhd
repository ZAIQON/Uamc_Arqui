
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath is
    Port (
        clk       : in  STD_LOGIC;
        Cw        : in  STD_LOGIC_VECTOR(16 downto 0); -- 17 bits desde Unidad de Control
        Inm       : in  STD_LOGIC_VECTOR(7 downto 0);
        W_enable  : in  STD_LOGIC;                     -- permiso de escritura (W_gated)
        Datos_In  : in  STD_LOGIC_VECTOR(7 downto 0);  -- datos desde la RAM
        Datos_Out : out STD_LOGIC_VECTOR(7 downto 0);  -- datos hacia la RAM
        Dir_Out   : out STD_LOGIC_VECTOR(7 downto 0);  -- dirección hacia la RAM
        Banderas  : out STD_LOGIC_VECTOR(3 downto 0)   -- (C, S_f, V, Z)
    );
end Datapath;

architecture Estructural_Top of Datapath is
    component Unidad8egistros is Port ( clk, W : in STD_LOGIC; DC, DB, DA : in STD_LOGIC_VECTOR(2 downto 0); C : in STD_LOGIC_VECTOR(7 downto 0); A, B : out STD_LOGIC_VECTOR(7 downto 0)); end component;
    component UF is Port ( A, B : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC_VECTOR(4 downto 0); R : out STD_LOGIC_VECTOR(7 downto 0); C, S_f, V, Z : out STD_LOGIC); end component;
    component Mux2a1_8 is Port ( I0, I1 : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC; O : out STD_LOGIC_VECTOR(7 downto 0)); end component;

    signal bus_A, bus_B  : STD_LOGIC_VECTOR(7 downto 0);
    signal out_M1, out_M2 : STD_LOGIC_VECTOR(7 downto 0);
    signal out_UF         : STD_LOGIC_VECTOR(7 downto 0);
    signal sig_C           : STD_LOGIC;
    signal sig_S_f         : STD_LOGIC;
    signal sig_V           : STD_LOGIC;
    signal sig_Z           : STD_LOGIC;

    signal c_da : STD_LOGIC_VECTOR(2 downto 0);
    signal c_db : STD_LOGIC_VECTOR(2 downto 0);
    signal c_dc : STD_LOGIC_VECTOR(2 downto 0);
    signal c_s  : STD_LOGIC_VECTOR(4 downto 0);
    signal c_m1 : STD_LOGIC;
    signal c_m2 : STD_LOGIC;
begin

    c_da <= Cw(16 downto 14);
    c_db <= Cw(13 downto 11);
    c_dc <= Cw(10 downto 8);
    c_s  <= Cw(7 downto 3);
    c_m1 <= Cw(2);
    c_m2 <= Cw(1);

    BANCO_REG: Unidad8egistros port map (
        clk => clk, W => W_enable, DC => c_dc, DB => c_db, DA => c_da,
        C => out_M2, A => bus_A, B => bus_B
    );

    MUX_1: Mux2a1_8 port map (I0 => bus_B, I1 => Inm, S => c_m1, O => out_M1);

    UNID_FUNC: UF port map (
        A => bus_A, B => out_M1, S => c_s, R => out_UF,
        C => sig_C, S_f => sig_S_f, V => sig_V, Z => sig_Z
    );

    MUX_2: Mux2a1_8 port map (I0 => out_UF, I1 => Datos_In, S => c_m2, O => out_M2);

    Dir_Out   <= out_UF;
    Datos_Out <= bus_B;
    Banderas  <= sig_C & sig_S_f & sig_V & sig_Z;
end Estructural_Top;