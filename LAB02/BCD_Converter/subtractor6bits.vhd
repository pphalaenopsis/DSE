library ieee;
use ieee.std_logic_1164.all;

ENTITY subtractor6bits IS
PORT( OP1, OP2: in std_logic_vector(5 downto 0); --operands
      R : out std_logic_vector(5 downto 0) --result
		);
END subtractor6bits;

ARCHITECTURE behavior OF subtractor6bits IS
COMPONENT subtractor IS
PORT( X, Y, Cin : in std_logic;
      S, Cout : out std_logic);
END COMPONENT;

SIGNAL C1, C2, C3, C4, C5, C6: std_logic;
SIGNAL TMP: std_logic_vector(5 downto 0);

BEGIN
TMP <= OP2 XOR "111111"; --K=1 the adder becomes a subractor 
FA0:subtractor port map(OP1(0),TMP(0),'1', R(0),C1);-- R0
FA1:subtractor port map(OP1(1),TMP(1),C1, R(1),C2);-- R1
FA2:subtractor port map(OP1(2),TMP(2),C2, R(2),C3);-- R2
FA3:subtractor port map(OP1(3),TMP(3),C3, R(3),C4);-- R3
FA4:subtractor port map(OP1(4),TMP(4),C4, R(4),C5);-- R4
FA5:subtractor port map(OP1(5),TMP(5),C5, R(5),C6);-- R5
END behavior;