LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY counter16bits IS
PORT (
   SW: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	-- enable : IN STD_LOGIC;
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- reset
	-- RESET : IN STD_LOGIC;
	-- Q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	HEX0,HEX1,HEX2,HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END counter16bits;

ARCHITECTURE behavior OF counter16bits IS

-- subcomponents

COMPONENT counter4bits is
PORT (
	enable : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	en_out: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT segment7 is
PORT(
	M: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	DISPLAY: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END COMPONENT;

-- signals
SIGNAL Q0,Q1,Q2,Q3: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL e0,e1,e2,e3: STD_LOGIC;
SIGNAL Q_tmp: STD_LOGIC_VECTOR(15 DOWNTO 0);


begin


c4b0: counter4bits port map(SW(1),KEY(0),SW(0),Q0,e0);
c4b1: counter4bits port map(e0,KEY(0),SW(0),Q1,e1);
C4b2: counter4bits port map(e1,KEY(0),SW(0),Q2,e2);
C4b3: counter4bits port map(e2,KEY(0),SW(0),Q3,e3);

-- Q <= Q3&Q2&Q1&Q0;

decoder0: segment7 port map(Q0, HEX0);
decoder1: segment7 port map(Q1, HEX1);
decoder2: segment7 port map(Q2, HEX2);
decoder3: segment7 port map(Q3, HEX3);


       
end behavior;