LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY rca4bits IS
PORT (
  SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0);  -- KEY1 CLK, KEY0 RST
  HEX0, HEX1, HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  SUMout: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  REG1,REG2,REG3: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)  -- CHECK FOR SUM
);
END rca4bits;

ARCHITECTURE behavior OF rca4bits IS
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
SIGNAL SUM: STD_LOGIC_VECTOR(3 DOWNTO 0); 
SIGNAL CIN, COUT, O: STD_LOGIC;

BEGIN

  regA: regn PORT MAP(signed(SW(3 DOWNTO 0)), KEY(1), KEY(0), OP1);
  regB: regn PORT MAP(signed(SW(7 DOWNTO 4)), KEY(1), KEY(0), OP2);
  REG1<=std_logic_vector(OP1);
  REG2<= std_logic_vector(OP2);
  
  CIN <= '0';
  add4: adder PORT MAP(std_logic_vector(OP1), std_logic_vector(OP2), CIN, SUM, COUT);
  
  ffCout: flipflop PORT MAP(COUT, KEY(1), KEY(0), O);
  regS: regn PORT MAP(signed(SUM), KEY(1), KEY(0), R);
  REG3 <= std_logic_vector(R);
  -- display in hexadecimal + overflow
  
  dispA: segment7 PORT MAP(std_logic_vector(OP1), HEX0);
  dispB: segment7 PORT MAP(std_logic_vector(OP2), HEX1);
  dispS: segment7 PORT MAP(std_logic_vector(R), HEX2);
  LEDR(9) <= O;
  
  SUMout <= SUM;
  
END behavior;