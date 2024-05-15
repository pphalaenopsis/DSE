LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY counter4bits IS
PORT (
	enable : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	en_out: OUT STD_LOGIC
);
END counter4bits;

ARCHITECTURE behavior OF counter4bits IS

-- subcomponents
COMPONENT tflipflop is
Port (
	T : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	rst : IN STD_LOGIC;
	Q : OUT STD_LOGIC
	
);
END COMPONENT;

-- signals
SIGNAL Q_int: STD_LOGIC_VECTOR(3 DOWNTO 0);
--signal tin: std_logic_vector (3 DOWNTO 0); 
SIGNAL t1,t2,t3: STD_LOGIC;
begin


--tin <=  ( enable, enable and Q_int(0), tin(1) and Q_int(1), tin(2) and Q_int(2));
-- four bits

TFF0: tflipflop port map (enable, CLK, RESET, Q_int(0));

t1 <= enable AND Q_int(0);
TFF1: tflipflop port map (t1, CLK, RESET, Q_int(1));

t2 <= t1 AND Q_int(1);
TFF2: tflipflop port map (t2, CLK, RESET, Q_int(2));

t3 <= t2 AND Q_int(2);
TFF3: tflipflop port map (t3, CLK, RESET, Q_int(3)); 


Q <= Q_int;
en_out <= (t3 and Q_int(3));
       
end behavior;