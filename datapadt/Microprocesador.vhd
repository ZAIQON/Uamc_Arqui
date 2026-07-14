library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Microprocesador is
    Port (
        clk         : in  STD_LOGIC;
        rst         : in  STD_LOGIC;
        -- Conexiones hacia las memorias externas (Código y Datos)
        Instruccion : in  STD_LOGIC_VECTOR(25 downto 0); -- Viene de ROM
        Dato_In     : in  STD_LOGIC_VECTOR(7 downto 0);  -- Viene de RAM
        Dir_Codigo  : out STD_LOGIC_VECTOR(9 downto 0);  -- Va a ROM
        Dir_Datos   : out STD_LOGIC_VECTOR(7 downto 0);  -- Va a RAM
        Dato_Out    : out STD_LOGIC_VECTOR(7 downto 0);  -- Va a RAM
        Mem_Write   : out STD_LOGIC                      -- Permiso para escribir en RAM
    );
end Microprocesador;

architecture Malla_Global of Microprocesador is
    -- 1. Invocamos tu Datapath
    component Datapath is
        Port ( 
            clk       : in  STD_LOGIC;
            Cw        : in  STD_LOGIC_VECTOR(16 downto 0);
            Inm       : in  STD_LOGIC_VECTOR(7 downto 0);
            W_enable  : in  STD_LOGIC;
            Datos_In  : in  STD_LOGIC_VECTOR(7 downto 0);
            Datos_Out : out STD_LOGIC_VECTOR(7 downto 0);
            Dir_Out   : out STD_LOGIC_VECTOR(7 downto 0);
            Banderas  : out STD_LOGIC_VECTOR(3 downto 0) -- (C, S, V, Z)
        );
    end component;

    -- 2. Invocamos tu Unidad de Control Actualizada
    component UnidadControl is
        Port (
            clk       : in  STD_LOGIC;
            rst       : in  STD_LOGIC;
            D_codigo  : in  STD_LOGIC_VECTOR(25 downto 0);
            Banderas  : in  STD_LOGIC_VECTOR(3 downto 0); -- NUEVO: Banderas del Datapath
            A_codigo  : out STD_LOGIC_VECTOR(9 downto 0);
            Cw        : out STD_LOGIC_VECTOR(16 downto 0);
            Inm       : out STD_LOGIC_VECTOR(7 downto 0);
            W_gated   : out STD_LOGIC;
            MW_gated  : out STD_LOGIC
        );
    end component;

    -- Cables internos gigantes que cruzan de un lado a otro del procesador
    signal cable_Cw       : STD_LOGIC_VECTOR(16 downto 0);
    signal cable_Inm      : STD_LOGIC_VECTOR(7 downto 0);
    signal cable_Banderas : STD_LOGIC_VECTOR(3 downto 0);
    signal cable_W        : STD_LOGIC;
begin

    -- Conectamos la caja del CEREBRO (Unidad de Control)
    CEREBRO: UnidadControl port map (
        clk       => clk,
        rst       => rst,
        D_codigo  => Instruccion,    -- La instrucción entra aquí
        Banderas  => cable_Banderas, -- Recibe el aviso del estado matemático
        A_codigo  => Dir_Codigo,     -- Escupe qué instrucción sigue
        Cw        => cable_Cw,       -- Manda los botones de control al músculo
        Inm       => cable_Inm,      -- Manda el número directo al músculo
        W_gated   => cable_W,        -- Manda el permiso de escribir registros
        MW_gated  => Mem_Write       -- Manda el permiso de escribir en RAM
    );

    -- Conectamos la caja del MÚSCULO (Datapath)
    MUSCULO: Datapath port map (
        clk       => clk,
        Cw        => cable_Cw,       -- Recibe los botones del cerebro
        Inm       => cable_Inm,      -- Recibe el número directo
        W_enable  => cable_W,        -- Recibe el permiso de guardar en sus registros
        Datos_In  => Dato_In,        -- Lee los datos de la RAM externa
        Datos_Out => Dato_Out,       -- Escupe datos hacia la RAM externa
        Dir_Out   => Dir_Datos,      -- Indica en qué lugar de la RAM trabajar
        Banderas  => cable_Banderas  -- Avisa al cerebro si hubo ceros, negativos, etc.
    );

end Malla_Global;