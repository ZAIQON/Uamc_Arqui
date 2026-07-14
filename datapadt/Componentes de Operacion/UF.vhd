library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UF is
    Port ( A, B : in  STD_LOGIC_VECTOR(7 downto 0);
           S    : in  STD_LOGIC_VECTOR(4 downto 0); 
           R    : out STD_LOGIC_VECTOR(7 downto 0);
           C    : out STD_LOGIC;
           S_f  : out STD_LOGIC;
           V    : out STD_LOGIC;
           Z    : out STD_LOGIC);
end UF;

architecture Estructural of UF is
    component ALU is Port ( A, B : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC_VECTOR(3 downto 0); Res : out STD_LOGIC_VECTOR(7 downto 0); Cout_A, V_A : out STD_LOGIC); end component;
    component shifter is Port ( A : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC; Res : out STD_LOGIC_VECTOR(7 downto 0)); end component;
    component Mux2a1_8 is Port ( I0, I1 : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC; O : out STD_LOGIC_VECTOR(7 downto 0)); end component;

    signal alu_out, shift_out, final_out : STD_LOGIC_VECTOR(7 downto 0);
    signal c_alu, v_alu : STD_LOGIC;
begin
    BLOQUE_ALU: ALU port map (A => A, B => B, S => S(3 downto 0), Res => alu_out, Cout_A => c_alu, V_A => v_alu);
    BLOQUE_SHI: shifter port map (A => A, S => S(0), Res => shift_out);
    
    MUX_UF: Mux2a1_8 port map (I0 => alu_out, I1 => shift_out, S => S(4), O => final_out);
    
    R   <= final_out;
    C   <= c_alu and not S(4); 
    V   <= v_alu and not S(4);
    S_f <= final_out(7);      
    Z   <= not (final_out(0) or final_out(1) or final_out(2) or final_out(3) or 
                final_out(4) or final_out(5) or final_out(6) or final_out(7));
end Estructural;