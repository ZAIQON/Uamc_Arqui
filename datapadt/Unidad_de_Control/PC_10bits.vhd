library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PC_10bits is
    Port (
        clk     : in  STD_LOGIC;
        C       : in  STD_LOGIC; -- Cable para avanzar (+1)
        W       : in  STD_LOGIC; -- Cable para borrar (poner en 0)
        L       : in  STD_LOGIC; -- NUEVO: Cable para saltar (Load)
        D_salto : in  STD_LOGIC_VECTOR(9 downto 0); -- NUEVO: Dirección del salto
        A       : out STD_LOGIC_VECTOR(9 downto 0)
    );
end PC_10bits;

architecture Estructural_Puro of PC_10bits is
    component Reg_10bits is
        Port ( clk : in STD_LOGIC; D : in STD_LOGIC_VECTOR(9 downto 0); Q : out STD_LOGIC_VECTOR(9 downto 0) );
    end component;

    signal Q_reg, val_inc : STD_LOGIC_VECTOR(9 downto 0);
    signal val_next_C, val_next_L, D_reg : STD_LOGIC_VECTOR(9 downto 0);
begin
    REG_INTERNO: Reg_10bits port map ( clk => clk, D => D_reg, Q => Q_reg );
    
    val_inc <= std_logic_vector(unsigned(Q_reg) + 1);

    -- 1. Decide si avanza (+1) o se queda igual
    val_next_C(0) <= (Q_reg(0) and not C) or (val_inc(0) and C);
    val_next_C(1) <= (Q_reg(1) and not C) or (val_inc(1) and C);
    val_next_C(2) <= (Q_reg(2) and not C) or (val_inc(2) and C);
    val_next_C(3) <= (Q_reg(3) and not C) or (val_inc(3) and C);
    val_next_C(4) <= (Q_reg(4) and not C) or (val_inc(4) and C);
    val_next_C(5) <= (Q_reg(5) and not C) or (val_inc(5) and C);
    val_next_C(6) <= (Q_reg(6) and not C) or (val_inc(6) and C);
    val_next_C(7) <= (Q_reg(7) and not C) or (val_inc(7) and C);
    val_next_C(8) <= (Q_reg(8) and not C) or (val_inc(8) and C);
    val_next_C(9) <= (Q_reg(9) and not C) or (val_inc(9) and C);

    -- 2. NUEVO: Decide si toma el valor de avance o toma la dirección del salto
    val_next_L(0) <= (val_next_C(0) and not L) or (D_salto(0) and L);
    val_next_L(1) <= (val_next_C(1) and not L) or (D_salto(1) and L);
    val_next_L(2) <= (val_next_C(2) and not L) or (D_salto(2) and L);
    val_next_L(3) <= (val_next_C(3) and not L) or (D_salto(3) and L);
    val_next_L(4) <= (val_next_C(4) and not L) or (D_salto(4) and L);
    val_next_L(5) <= (val_next_C(5) and not L) or (D_salto(5) and L);
    val_next_L(6) <= (val_next_C(6) and not L) or (D_salto(6) and L);
    val_next_L(7) <= (val_next_C(7) and not L) or (D_salto(7) and L);
    val_next_L(8) <= (val_next_C(8) and not L) or (D_salto(8) and L);
    val_next_L(9) <= (val_next_C(9) and not L) or (D_salto(9) and L);

    -- 3. Decide si guarda los datos o se borra a cero por completo (W)
    D_reg(0) <= val_next_L(0) and not W;
    D_reg(1) <= val_next_L(1) and not W;
    D_reg(2) <= val_next_L(2) and not W;
    D_reg(3) <= val_next_L(3) and not W;
    D_reg(4) <= val_next_L(4) and not W;
    D_reg(5) <= val_next_L(5) and not W;
    D_reg(6) <= val_next_L(6) and not W;
    D_reg(7) <= val_next_L(7) and not W;
    D_reg(8) <= val_next_L(8) and not W;
    D_reg(9) <= val_next_L(9) and not W;

    A <= Q_reg;
end Estructural_Puro;