library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UnidadControl is
    Port (
        clk       : in  STD_LOGIC;                     -- Reloj
        rst       : in  STD_LOGIC;                     -- Reset 
        D_codigo  : in  STD_LOGIC_VECTOR(25 downto 0); -- Entrada:La instrucción que viene de afuera
        A_codigo  : out STD_LOGIC_VECTOR(9 downto 0);  -- Salida:La dirección que pide el PC a la memoria
        Cw        : out STD_LOGIC_VECTOR(16 downto 0); -- Salida:Los botones de control para el Datapath
        Inm       : out STD_LOGIC_VECTOR(7 downto 0);  -- Salida:El número inmediato para el Datapath
        W_gated   : out STD_LOGIC;                     -- Salida:W protegido por la compuerta AND de abajo
        MW_gated  : out STD_LOGIC;                     -- Salida:El cable MW protegido por la compuerta AND de arriba
        Banderas  : in  STD_LOGIC_VECTOR(3 downto 0)   -- Entrada: Banderas del Datapath (C, S_f, V, Z)
    );
end UnidadControl;

architecture Estructural_Malla of UnidadControl is
    component PC_10bits is
        Port ( clk : in STD_LOGIC; C : in STD_LOGIC; W : in STD_LOGIC; L : in STD_LOGIC; D_salto : in STD_LOGIC_VECTOR(9 downto 0); A : out STD_LOGIC_VECTOR(9 downto 0) );
    end component;

    component IR_26bits is
        Port ( clk : in STD_LOGIC; W : in STD_LOGIC; D : in STD_LOGIC_VECTOR(25 downto 0);
               Cw : out STD_LOGIC_VECTOR(16 downto 0); Inm : out STD_LOGIC_VECTOR(7 downto 0);
               W_bit : out STD_LOGIC; MW_bit : out STD_LOGIC );
    end component;

    component Secuenciador is
        Port ( clk : in STD_LOGIC; rst : in STD_LOGIC; E0 : out STD_LOGIC; E1 : out STD_LOGIC; E2 : out STD_LOGIC; E3 : out STD_LOGIC );
    end component;

    
    signal sig_E0, sig_E1, sig_E2, sig_E3 : STD_LOGIC; -- Los cables de los 4 momentos del secuenciador
    signal ir_w, ir_mw                    : STD_LOGIC; -- Los cables originales W y MW que salen del IR
begin
    
    CAJA_PC: PC_10bits port map ( 
        clk => clk, 
        C   => sig_E0, -- Se conecta al momento E0
        W   => sig_E1, -- Se conecta al momento E1
        L   => '0',    -- Sin lógica de salto conectada (placeholder)
        D_salto => (others => '0'), -- Dirección de salto no conectada (placeholder)
        A   => A_codigo 
    );
    
   
    CAJA_IR: IR_26bits port map ( 
        clk    => clk, 
        W      => sig_E2, -- Se conecta al momento E2
        D      => D_codigo, 
        Cw     => Cw, 
        Inm    => Inm, 
        W_bit  => ir_w, 
        MW_bit => ir_mw 
    );
    
   
    CAJA_SEC: Secuenciador port map ( 
        clk => clk, 
        rst => rst, 
        E0  => sig_E0, 
        E1  => sig_E1, 
        E2  => sig_E2, 
        E3  => sig_E3  -- El momento E3 va hacia las compuertas AND
    );

   
    W_gated  <= ir_w and sig_E3;  -- Compuerta AND inferior 
    MW_gated <= ir_mw and sig_E3; -- Compuerta AND superior
end Estructural_Malla;