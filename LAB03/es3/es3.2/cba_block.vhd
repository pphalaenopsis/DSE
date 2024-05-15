LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY cba_block IS
PORT(
  A, B: STD_LOGIC_VECTOR(3 DOWNTO 0);
  CIN: IN STD_LOGIC;
  S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  COUT: OUT STD_LOGIC
);
END cba_block;

ARCHITECTURE behavior OF cba_block IS

COMPONENT adder
PORT(  A, B, CIN: IN STD_LOGIC;
       S, COUT,P: OUT STD_LOGIC);
		 
END COMPONENT;

COMPONENT b2to1mux IS
PORT (Cin,Clast: IN STD_LOGIC;  
		P: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		Cout: OUT STD_LOGIC);
END COMPONENT;

SIGNAL c1,c2,c3,c4,cf: STD_LOGIC;
SIGNAL p1,p2,p3,p4: STD_LOGIC;
SIGNAL prop_vect: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN 

adder0: adder PORT MAP(A(0),B(0),Cin,S(0),c1,p1);
adder1: adder PORT MAP(A(1),B(1),c1,S(1),c2,p2);
adder2: adder PORT MAP(A(2),B(2),c2,S(2),c3,p3);
adder3: adder PORT MAP(A(3),B(3),c3,S(3),c4,p4);

prop_vect <= p4&p3&p2&p1;
mux: b2to1mux PORT MAP(Cin,c4,prop_vect,cf);
COUT <= cf;


END behavior;
