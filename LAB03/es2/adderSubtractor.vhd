LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY adderSubtractor IS
PORT (
  SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
  KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0);  -- KEY1 CLK, KEY0 RST
  HEX0, HEX1, HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  SUMout: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)  -- CHECK FOR SUM
);
END adderSubtractor;

ARCHITECTURE behavior OF adderSubtractor IS
-- components
COMPONENT flipflop IS
PORT (
   D, Clock, Resetn : IN STD_LOGIC;
	Q : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT regn IS
GENERIC ( N : integer:=4);
PORT (
  R : IN SIGNED(N-1 DOWNTO 0);
  Clock, Resetn : IN STD_LOGIC;
  Q : OUT SIGNED(N-1 DOWNTO 0)
);
END COMPONENT;

COMPONENT mux IS
PORT(
  Z: IN STD_LOGIC;
  OPin, OPmod: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  SELECTED: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;		
		
COMPONENT adder IS
PORT ( 
  OP1, OP2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  CarryIN: IN STD_LOGIC;
  RES: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  CarryOUT: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT overflow IS
PORT (
  A, B, C: IN STD_LOGIC;
  OVER: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT segment7 IS
PORT(M: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
DISPLAY: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;

-- signals
SIGNAL OP1, OP2, R: SIGNED(3 DOWNTO 0);
SIGNAL SUM, OP2f, OPnew: STD_LOGIC_VECTOR(3 DOWNTO 0); 
SIGNAL CIN, COUT, O: STD_LOGIC;

BEGIN

  regA: regn PORT MAP(signed(SW(3 DOWNTO 0)), KEY(1), KEY(0), OP1);
  regB: regn PORT MAP(signed(SW(7 DOWNTO 4)), KEY(1), KEY(0), OP2);
  
  OP2f <= std_logic_vector(OP2) XOR "1111";
  mux0: mux PORT MAP(SW(8),std_logic_vector(OP2),OP2f, OPnew);
  add4: adder PORT MAP(std_logic_vector(OP1), OPnew, SW(8), SUM, COUT);
  
  ffCout: flipflop PORT MAP(COUT, KEY(1), KEY(0), O);
  regS: regn PORT MAP(signed(SUM), KEY(1), KEY(0), R);

  -- display in hexadecimal + overflow
  
  dispA: segment7 PORT MAP(std_logic_vector(OP1), HEX0);
  dispB: segment7 PORT MAP(std_logic_vector(OP2), HEX1);
  dispS: segment7 PORT MAP(std_logic_vector(R), HEX2);
  LEDR(9) <= O;
  
  SUMout <= SUM;
  
END behavior;