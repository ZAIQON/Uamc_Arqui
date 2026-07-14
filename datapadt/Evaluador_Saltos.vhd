library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Evaluador_Saltos is
    Port (
        S        : in  STD_LOGIC_VECTOR(4 downto 0); -- Los 5 bits de tu tabla (S4, S3, S2, S1, S0)
        banderas : in  STD_LOGIC_VECTOR(3 downto 0); -- Las banderas del Datapath (C, S, V, Z)
        saltar   : out STD_LOGIC                     -- 1 si se cumple la condición de la tabla
    );
end Evaluador_Saltos;

architecture Logica_Pura of Evaluador_Saltos is
    signal flag_C, flag_S, flag_V, flag_Z : STD_LOGIC;
begin
    -- Separamos las banderas para que sea más fácil leer las compuertas
    flag_C <= banderas(3);
    flag_S <= banderas(2);
    flag_V <= banderas(1);
    flag_Z <= banderas(0);

    -- Ecuación gigante estructural basada EXACTAMENTE en tu tabla de Excel
    saltar <= 
        -- JMP (1 0 1 1 1): Salto sin condición
        (S(4) and not S(3) and S(2) and S(1) and S(0)) or
        
        -- JC (1 1 0 0 0): Salta si C = 1
        (S(4) and S(3) and not S(2) and not S(1) and not S(0) and flag_C) or
        
        -- JNC (1 1 0 0 1): Salta si C = 0
        (S(4) and S(3) and not S(2) and not S(1) and S(0) and not flag_C) or
        
        -- JS (1 1 0 1 0): Salta si S_flag = 1
        (S(4) and S(3) and not S(2) and S(1) and not S(0) and flag_S) or
        
        -- JNS (1 1 0 1 1): Salta si S_flag = 0
        (S(4) and S(3) and not S(2) and S(1) and S(0) and not flag_S) or
        
        -- JV (1 1 1 0 0): Salta si V = 1
        (S(4) and S(3) and S(2) and not S(1) and not S(0) and flag_V) or
        
        -- JNV (1 1 1 0 1): Salta si V = 0
        (S(4) and S(3) and S(2) and not S(1) and S(0) and not flag_V) or
        
        -- JZ / JE (1 1 1 1 0): Salta si Z = 1
        (S(4) and S(3) and S(2) and S(1) and not S(0) and flag_Z) or
        
        -- JNZ / JNE (1 1 1 1 1): Salta si Z = 0
        (S(4) and S(3) and S(2) and S(1) and S(0) and not flag_Z);

end Logica_Pura;