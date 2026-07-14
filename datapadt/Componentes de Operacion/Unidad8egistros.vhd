library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Unidad8egistros is
    Port ( clk : in  STD_LOGIC;
           W   : in  STD_LOGIC;
           DC  : in  STD_LOGIC_VECTOR(2 downto 0);
           DB  : in  STD_LOGIC_VECTOR(2 downto 0);
           DA  : in  STD_LOGIC_VECTOR(2 downto 0);
           C   : in  STD_LOGIC_VECTOR(7 downto 0);
           A   : out STD_LOGIC_VECTOR(7 downto 0);
           B   : out STD_LOGIC_VECTOR(7 downto 0));
end Unidad8egistros;

architecture Estructural of Unidad8egistros is
    component Decodificador3a8 is Port ( S : in STD_LOGIC_VECTOR(2 downto 0); En : in STD_LOGIC; O : out STD_LOGIC_VECTOR(7 downto 0)); end component;
    component Registro8Bits is Port ( clk, W : in STD_LOGIC; D : in STD_LOGIC_VECTOR(7 downto 0); Q : out STD_LOGIC_VECTOR(7 downto 0)); end component;
    component Mux8a1_8 is Port ( I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC_VECTOR(2 downto 0); O : out STD_LOGIC_VECTOR(7 downto 0)); end component;

    signal lines_w : STD_LOGIC_VECTOR(7 downto 0);
    signal r0, r1, r2, r3, r4, r5, r6, r7 : STD_LOGIC_VECTOR(7 downto 0);
begin
    DEC: Decodificador3a8 port map (S => DC, En => W, O => lines_w);

    REG0: Registro8Bits port map (clk => clk, W => lines_w(0), D => C, Q => r0);
    REG1: Registro8Bits port map (clk => clk, W => lines_w(1), D => C, Q => r1);
    REG2: Registro8Bits port map (clk => clk, W => lines_w(2), D => C, Q => r2);
    REG3: Registro8Bits port map (clk => clk, W => lines_w(3), D => C, Q => r3);
    REG4: Registro8Bits port map (clk => clk, W => lines_w(4), D => C, Q => r4);
    REG5: Registro8Bits port map (clk => clk, W => lines_w(5), D => C, Q => r5);
    REG6: Registro8Bits port map (clk => clk, W => lines_w(6), D => C, Q => r6);
    REG7: Registro8Bits port map (clk => clk, W => lines_w(7), D => C, Q => r7);

    MUX_CANAL_A: Mux8a1_8 port map (I0=>r0, I1=>r1, I2=>r2, I3=>r3, I4=>r4, I5=>r5, I6=>r6, I7=>r7, S=>DA, O=>A);
    MUX_CANAL_B: Mux8a1_8 port map (I0=>r0, I1=>r1, I2=>r2, I3=>r3, I4=>r4, I5=>r5, I6=>r6, I7=>r7, S=>DB, O=>B);
end Estructural;