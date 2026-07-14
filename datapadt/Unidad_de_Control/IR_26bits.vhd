library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR_26bits is
    Port (
        clk    : in  STD_LOGIC;                      -- El reloj 
        W      : in  STD_LOGIC;                      -- Si es 1, congela la nueva instrucción E2
        D      : in  STD_LOGIC_VECTOR(25 downto 0);  -- La instrucción de 26 bits que viene de la memoria
        Cw     : out STD_LOGIC_VECTOR(16 downto 0);  -- Los 17 bits de control para mover el Datapath
        Inm    : out STD_LOGIC_VECTOR(7 downto 0);   -- Los 8 bits del número inmediato
        W_bit  : out STD_LOGIC;                      -- El bit que dice si se quiere escribir en los registros
        MW_bit : out STD_LOGIC                       -- El bit que dice si se quiere escribir en la memoria
    );
end IR_26bits;

architecture Estructural_Puro of IR_26bits is

    component Reg_26bits is
        Port ( clk : in STD_LOGIC; D : in STD_LOGIC_VECTOR(25 downto 0); Q : out STD_LOGIC_VECTOR(25 downto 0) );
    end component;

    signal Q_reg : STD_LOGIC_VECTOR(25 downto 0); -- La instrucción que está guardada adentro actualmente
    signal D_reg : STD_LOGIC_VECTOR(25 downto 0); -- Lo que vamos a decidir guardar para el siguiente paso
begin
   
    REG_INTERNO: Reg_26bits port map ( clk => clk, D => D_reg, Q => Q_reg );

    --Si W es 1, deja pasar la nueva instrucción D. Si W es 0, vuelve a guardar lo que ya tenía Q_reg
    D_reg(0)  <= (Q_reg(0)  and not W) or (D(0)  and W); D_reg(1)  <= (Q_reg(1)  and not W) or (D(1)  and W);
    D_reg(2)  <= (Q_reg(2)  and not W) or (D(2)  and W); D_reg(3)  <= (Q_reg(3)  and not W) or (D(3)  and W);
    D_reg(4)  <= (Q_reg(4)  and not W) or (D(4)  and W); D_reg(5)  <= (Q_reg(5)  and not W) or (D(5)  and W);
    D_reg(6)  <= (Q_reg(6)  and not W) or (D(6)  and W); D_reg(7)  <= (Q_reg(7)  and not W) or (D(7)  and W);
    D_reg(8)  <= (Q_reg(8)  and not W) or (D(8)  and W); D_reg(9)  <= (Q_reg(9)  and not W) or (D(9)  and W);
    D_reg(10) <= (Q_reg(10) and not W) or (D(10) and W); D_reg(11) <= (Q_reg(11) and not W) or (D(11) and W);
    D_reg(12) <= (Q_reg(12) and not W) or (D(12) and W); D_reg(13) <= (Q_reg(13) and not W) or (D(13) and W);
    D_reg(14) <= (Q_reg(14) and not W) or (D(14) and W); D_reg(15) <= (Q_reg(15) and not W) or (D(15) and W);
    D_reg(16) <= (Q_reg(16) and not W) or (D(16) and W); D_reg(17) <= (Q_reg(17) and not W) or (D(17) and W);
    D_reg(18) <= (Q_reg(18) and not W) or (D(18) and W); D_reg(19) <= (Q_reg(19) and not W) or (D(19) and W);
    D_reg(20) <= (Q_reg(20) and not W) or (D(20) and W); D_reg(21) <= (Q_reg(21) and not W) or (D(21) and W);
    D_reg(22) <= (Q_reg(22) and not W) or (D(22) and W); D_reg(23) <= (Q_reg(23) and not W) or (D(23) and W);
    D_reg(24) <= (Q_reg(24) and not W) or (D(24) and W); D_reg(25) <= (Q_reg(25) and not W) or (D(25) and W);

   
    Cw     <= Q_reg(25 downto 9); -- Los primeros 17 bits van al Datapath
    Inm    <= Q_reg(8 downto 1);  -- Los 8 bits del centro son el Inmediato
    MW_bit <= Q_reg(0);           -- El último bit es para la memoria de datos
    W_bit  <= Q_reg(9);           -- El bit que controla si el Datapath guarda datos
end Estructural_Puro;