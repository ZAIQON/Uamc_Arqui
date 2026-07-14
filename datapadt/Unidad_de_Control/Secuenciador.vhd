library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Secuenciador is
    Port (
        clk : in  STD_LOGIC; -- El reloj 
        rst : in  STD_LOGIC; -- Botón para reiniciar el tiempo al principio
        E0  : out STD_LOGIC; -- contar,avanzar el PC
        E1  : out STD_LOGIC; -- limpiar,iniciar todo
        E2  : out STD_LOGIC; -- buscar la instrucción en la memoria
        E3  : out STD_LOGIC  -- ejecutar la orden
    );
end Secuenciador;

architecture Estructural_Puro of Secuenciador is
    
    component Reg_4bits is
        Port ( clk : in STD_LOGIC; D : in STD_LOGIC_VECTOR(3 downto 0); Q : out STD_LOGIC_VECTOR(3 downto 0) );
    end component;

    signal Q_reg : STD_LOGIC_VECTOR(3 downto 0); -- En qué momento estamos parados
    signal D_reg : STD_LOGIC_VECTOR(3 downto 0); -- A qué momento vamos a pasar después
begin
    REG_ESTADO: Reg_4bits port map ( clk => clk, D => D_reg, Q => Q_reg );

    D_reg(0) <= rst;                                        -- Si presionas reset, te manda directo al momento 1 E1
    D_reg(1) <= (Q_reg(0) or Q_reg(3)) and not rst;         -- Pasa a E2 después de iniciar o después de ejecutar
    D_reg(2) <= Q_reg(1) and not rst;                       -- Pasa a E0 después de leer la instrucción
    D_reg(3) <= Q_reg(2) and not rst;                       -- Pasa a E3 después de contar
    E1 <= Q_reg(0); -- Salida de inicio
    E2 <= Q_reg(1); -- Salida de buscar
    E0 <= Q_reg(2); -- Salida de contar
    E3 <= Q_reg(3); -- Salida de ejecutar
end Estructural_Puro;