LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY carrySelect IS
PORT (
  A, B: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  KEY: STD_LOGIC_VECTOR(1 DOWNTO 0);
  R: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
  Cout: OUT STD_LOGIC
);
END carrySelect;


ARCHITECTURE behavior OF carrySelect IS
-- component 
COMPONENT adder4bits IS
PORT (
  A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cin: IN STD_LOGIC;
  S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT mux IS
PORT (
  Ca,Cb,z: IN STD_LOGIC; 
  Cnext: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT muxSum IS
PORT (
  Ra,Rb: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  z: IN STD_LOGIC; 
  R: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
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

-- signals 
SIGNAL carryIN, c11, c12, c21, c22, c31, c32, c4, c8, carry12, c16: STD_LOGIC;
SIGNAL tmpResA, tmpResB: STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";

SIGNAL A1, B1, S1: SIGNED(3 DOWNTO 0);
SIGNAL A2, B2, S2: SIGNED(3 DOWNTO 0);
SIGNAL A3, B3, S3: SIGNED(3 DOWNTO 0);
SIGNAL A4, B4, S4: SIGNED(3 DOWNTO 0);
SIGNAL RES: STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";
SIGNAL RES1: SIGNED(15 DOWNTO 0);

BEGIN


-- registers inputs
regnA1: regn PORT MAP(signed(A(3 DOWNTO 0)), KEY(1), KEY(0), A1);
regnB1: regn PORT MAP(signed(B(3 DOWNTO 0)), KEY(1), KEY(0), B1);

regnA2: regn PORT MAP(signed(A(7 DOWNTO 4)), KEY(1), KEY(0), A2);
regnB2: regn PORT MAP(signed(B(7 DOWNTO 4)), KEY(1), KEY(0), B2);

regnA3: regn PORT MAP(signed(A(11 DOWNTO 8)), KEY(1), KEY(0), A3);
regnB3: regn PORT MAP(signed(B(11 DOWNTO 8)), KEY(1), KEY(0), B3);

regnA4: regn PORT MAP(signed(A(15 DOWNTO 12)), KEY(1), KEY(0), A4);
regnB4: regn PORT MAP(signed(B(15 DOWNTO 12)), KEY(1), KEY(0), B4);

-- actual structure
carryIN <= '0';
add0: adder4bits PORT MAP(std_logic_vector(A1), std_logic_vector(B1), carryIN, RES(3 DOWNTO 0), c4);

add11: adder4bits PORT MAP(std_logic_vector(A2), std_logic_vector(B2), carryIN, tmpResA(7 DOWNTO 4), c11); 
add12: adder4bits PORT MAP(std_logic_vector(A2), std_logic_vector(B2), '1', tmpResB(7 DOWNTO 4), c12);
muxR1: muxSum PORT MAP(tmpResA(7 DOWNTO 4), tmpResB(7 DOWNTO 4), c4, RES(7 DOWNTO 4));
muxC1: mux PORT MAP(c11, c12, c4, c8);

add21: adder4bits PORT MAP(std_logic_vector(A3), std_logic_vector(B3), carryIN, tmpResA(11 DOWNTO 8), c21);
add22: adder4bits PORT MAP(std_logic_vector(A3), std_logic_vector(B3), '1', tmpResB(11 DOWNTO 8), c22);
muxR2: muxSum PORT MAP(tmpResA(11 DOWNTO 8), tmpResB(11 DOWNTO 8), c8, RES(11 DOWNTO 8));
muxC2: mux PORT MAP(c21, c22, c8, carry12);

add31: adder4bits PORT MAP(std_logic_vector(A4), std_logic_vector(B4), carryIN, tmpResA(15 DOWNTO 12), c31);
add32: adder4bits PORT MAP(std_logic_vector(A4), std_logic_vector(B4), '1', tmpResB(15 DOWNTO 12), c32);
muxR3: muxSum PORT MAP(tmpResA(15 DOWNTO 12), tmpResB(15 DOWNTO 12), carry12, RES(15 DOWNTO 12));
muxC3: mux PORT MAP(c31, c32, carry12, c16);

-- registers output
regnS1: regn PORT MAP(signed(RES(3 DOWNTO 0)), KEY(1), KEY(0), RES1(3 DOWNTO 0));
regnS2: regn PORT MAP(signed(RES(7 DOWNTO 4)), KEY(1), KEY(0), RES1(7 DOWNTO 4));
regnS3: regn PORT MAP(signed(RES(11 DOWNTO 8)), KEY(1), KEY(0), RES1(11 DOWNTO 8));
regnS4: regn PORT MAP(signed(RES(15 DOWNTO 12)), KEY(1), KEY(0), RES1(15 DOWNTO 12));

-- ff carry out

ffc: flipflop PORT MAP(c16 ,KEY(1), KEY(0), Cout);
R <= std_logic_vector(RES1);

END behavior;
