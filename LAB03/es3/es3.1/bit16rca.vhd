LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY bit16rca IS
PORT(
  A, B: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  S: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
  COUT: OUT STD_LOGIC
);
END bit16rca;

ARCHITECTURE behavior OF bit16rca IS

COMPONENT adder4bits IS
PORT (
  A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cin: IN STD_LOGIC;
  S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT flipflop IS
PORT (
   D, Clock, Resetn : IN STD_LOGIC;
	Q : OUT STD_LOGIC);
END COMPONENT;

COMPONENT regn IS
GENERIC ( N : integer:=4);
PORT (
  R : IN SIGNED(N-1 DOWNTO 0);
  Clock, Resetn : IN STD_LOGIC;
  Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

SIGNAL carry: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL carryin: STD_LOGIC;
SIGNAL A1, B1, S1: SIGNED(3 DOWNTO 0);
SIGNAL A2, B2, S2: SIGNED(3 DOWNTO 0);
SIGNAL A3, B3, S3: SIGNED(3 DOWNTO 0);
SIGNAL A4, B4, S4: SIGNED(3 DOWNTO 0);
SIGNAL RES: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL RES1: SIGNED(15 DOWNTO 0);

BEGIN

carryin <= '0';
regnA1: regn PORT MAP(signed(A(3 DOWNTO 0)), KEY(1), KEY(0), A1);
regnB1: regn PORT MAP(signed(B(3 DOWNTO 0)), KEY(1), KEY(0), B1);

regnA2: regn PORT MAP(signed(A(7 DOWNTO 4)), KEY(1), KEY(0), A2);
regnB2: regn PORT MAP(signed(B(7 DOWNTO 4)), KEY(1), KEY(0), B2);

regnA3: regn PORT MAP(signed(A(11 DOWNTO 8)), KEY(1), KEY(0), A3);
regnB3: regn PORT MAP(signed(B(11 DOWNTO 8)), KEY(1), KEY(0), B3);

regnA4: regn PORT MAP(signed(A(15 DOWNTO 12)), KEY(1), KEY(0), A4);
regnB4: regn PORT MAP(signed(B(15 DOWNTO 12)), KEY(1), KEY(0), B4);


adder0: adder4bits PORT MAP(std_logic_vector(A1), std_logic_vector(B1),carryin, RES(3 DOWNTO 0),carry(0));
adder1: adder4bits PORT MAP(std_logic_vector(A2), std_logic_vector(B2),carry(0),RES(7 DOWNTO 4),carry(1));
adder2: adder4bits PORT MAP(std_logic_vector(A3), std_logic_vector(B3),carry(1),RES(11 DOWNTO 8),carry(2));
adder3: adder4bits PORT MAP(std_logic_vector(A4), std_logic_vector(B4),carry(2),RES(15 DOWNTO 12),carry(3));
regnS1: regn PORT MAP(signed(RES(3 DOWNTO 0)), KEY(1), KEY(0), RES1(3 DOWNTO 0));
regnS2: regn PORT MAP(signed(RES(7 DOWNTO 4)), KEY(1), KEY(0), RES1(7 DOWNTO 4));
regnS3: regn PORT MAP(signed(RES(11 DOWNTO 8)), KEY(1), KEY(0), RES1(11 DOWNTO 8));
regnS4: regn PORT MAP(signed(RES(15 DOWNTO 12)), KEY(1), KEY(0), RES1(15 DOWNTO 12));

ffc: flipflop PORT MAP(carry(3),KEY(1), KEY(0), COUT);
S <= std_logic_vector(RES1);
END behavior;
