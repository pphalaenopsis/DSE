LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Top-Level Entity
ENTITY reactionCounter IS
PORT( 
	SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	CLOCK_50: IN STD_LOGIC;
	Qdowncount: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Qupcount: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	HEX0,HEX1,HEX2,HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	
);
END reactionCounter;

ARCHITECTURE Behavior OF reactionCounter IS 

-- Subcomponents
COMPONENT c16bit is
port(
	clock: in std_logic;
	reset: in std_logic;
	en_out: out std_logic
);
end COMPONENT;

COMPONENT count8bits IS 
PORT(
		START: IN UNSIGNED(7 DOWNTO 0);
		en_in: IN STD_LOGIC;
		CLOCK: IN STD_LOGIC;
		RESET: IN STD_LOGIC;
      Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		en_out: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT counter16bit IS 
PORT (
	enable : IN STD_LOGIC;
	onoff: IN STD_LOGIC;
	CLOCK : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	led_on: OUT STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT;

COMPONENT DoubleDabble IS 
PORT (
    bin: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    enable: in std_logic; -- same enable as up counter
    RST: IN STD_LOGIC;
    CLOCK: IN STD_LOGIC;
    BCD: OUT STD_LOGIC_VECTOR(19 DOWNTO 0)
);
END COMPONENT;

COMPONENT segment7 IS
PORT( 
   M: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
   DISPLAY: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;

COMPONENT flipflop IS
PORT (
   D, Clock, Reset : IN STD_LOGIC;
	Q : OUT STD_LOGIC);
END COMPONENT;

-- internal signals
SIGNAL enSecond: STD_LOGIC;
SIGNAL enable, enf, en1, en2: STD_LOGIC;
--SIGNAL Qdown: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Qup: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL bcd: STD_LOGIC_VECTOR(19 DOWNTO 0);
SIGNAL led: STD_LOGIC;

BEGIN

masterE: c16bit PORT MAP(ClOCK_50, KEY(0), enable);

enableFlop: flipflop PORT MAP(enSecond, ClOCK_50, KEY(0), enf);
en1 <= not enf and enable;
en2<= enf and enable;

downCount: count8bits PORT MAP(UNSIGNED(SW), en1, ClOCK_50, KEY(0), Qdowncount, enSecond);



upCount: counter16bit PORT MAP(en2, KEY(3), ClOCK_50, KEY(0), led, Qup);
Qupcount <= Qup;
LEDR <= "000000000" & (led AND KEY(3));

binToBCD: DoubleDabble PORT MAP(Qup, en2, KEY(0),CLOCK_50,bcd);

decoder0: segment7 PORT MAP(bcd(3 downto 0),HEX0);
decoder1: segment7 PORT MAP(bcd(7 downto 4),HEX1);
decoder2: segment7 PORT MAP(bcd(11 downto 8),HEX2);
decoder3: segment7 PORT MAP(bcd(15 downto 12),HEX3);




END behavior;