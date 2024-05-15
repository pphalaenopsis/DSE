LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY flashingDigits IS 
PORT( 
	clock_50: IN std_logic;
	SW: IN std_logic_vector(9 DOWNTO 0);
	HEX0: OUT std_logic_vector(6 DOWNTO 0);
	enable_prova: out std_logic
);
END flashingDigits; 

Architecture behavior of flashingDigits is

COMPONENT c26bit is
port(
	clock: in std_logic;
	reset: in std_logic;
	Q: out unsigned(25 DOWNTO 0);
	en_out: out std_logic
);
	 
END COMPONENT;

COMPONENT counter4bits is 
PORT (
	enable : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	RESET : IN STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

COMPONENT  segment7 IS
PORT(M: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
DISPLAY: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;


signal count_nano: unsigned(25 DOWNTO 0);
signal enable_sec: std_logic;
signal seconds: std_logic_vector(3 DOWNTO 0);

begin 

count0: c26bit PORT MAP( clock_50, SW(0), count_nano, enable_sec);
enable_prova <= enable_sec;
count1: counter4bits PORT MAP ( enable_sec, clock_50, SW(0), seconds);
decoder: segment7 PORT MAP (seconds, HEX0);

end behavior; 