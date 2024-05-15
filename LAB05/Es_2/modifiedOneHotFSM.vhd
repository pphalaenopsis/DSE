LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- in realtà es1
ENTITY ModifiedOneHotFSM IS 
PORT (
	SW: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- SW(1) -> w, SW(0) -> reset
	KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- KEY(0) -> clock
	
	f_visualState: OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	p_visualState: OUT STD_LOGIC_VECTOR(8 DOWNTO 0);

	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0) -- LEDR(0) -> Z
);
END ModifiedOneHotFSM;

ARCHITECTURE structural OF ModifiedOneHotFSM IS

-- component 
COMPONENT dflipflop is
Port (
        D : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
        rst : IN STD_LOGIC;
	Q : OUT STD_LOGIC
);
END COMPONENT;

-- signals
SIGNAL outb, outc, outd, oute, outf, outg, outh, outi: STD_LOGIC;
SIGNAL outa: STD_LOGIC ;
SIGNAL inb, inc, ind, ine, inf, ing, inh, ini: STD_LOGIC;
SIGNAL ina:STD_LOGIC;
SIGNAL p_stateVector, f_stateVector: STD_LOGIC_VECTOR(8 DOWNTO 0) := (others => '0');

BEGIN



ina <= outa or (not outb and  not outc and not outd and not oute and not outf and not outg and not outh and not outi);
flipA: dflipflop PORT MAP (ina, KEY(0), SW(0), outa);

inb <= (not outa or outf or outg or outh or outi) and not SW(1);
flipB: dflipflop PORT MAP (inb, KEY(0), SW(0), outb);

inc <= outb and not SW(1);
flipC: dflipflop PORT MAP (inc, KEY(0), SW(0), outc);

ind <= outc and not SW(1);
flipD: dflipflop PORT MAP (ind, KEY(0), SW(0), outd);

ine <= (outd and not SW(1)) or (oute and not SW(1));
flipE: dflipflop PORT MAP (ine, KEY(0), SW(0), oute);

inf <= (not outa or outb or outc or outd or oute) and SW(1);
flipF: dflipflop PORT MAP (inf, KEY(0), SW(0), outf);

ing <= outf and SW(1); 
flipG: dflipflop PORT MAP (ing, KEY(0), SW(0), outg);

inh <= outg and SW(1); 
flipH: dflipflop PORT MAP (inh, KEY(0), SW(0), outh);

ini <= (outi and SW(1)) or (outh and SW(1));
flipI: dflipflop PORT MAP (ini, KEY(0), SW(0), outi);

p_stateVector <= outi & outh & outg & outf & oute & outd & outc & outb & outa;
f_stateVector <= ini & inh & ing & inf & ine & ind & inc & inb & ina;
f_visualState <= f_stateVector;
p_visualState <= p_stateVector;


-- comb2
LEDR(9 DOWNTO 1) <= (others => '0');
LEDR(0) <= oute or outi;    
END structural;