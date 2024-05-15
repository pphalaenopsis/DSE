library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY memoryB IS
PORT (
   Data_in: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Address: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	CS, CLK, WR, RD: IN STD_LOGIC
);
END memoryB;

ARCHITECTURE behavioral OF memoryB IS
-- 1024 samples represented as 8 bit wide 2’s complement value

type RAM_ARRAY is array (0 to 2**6-1) of STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL mem: RAM_ARRAY;

BEGIN
PROCESS(CLK)
BEGIN
	IF rising_edge(clk) THEN 
		IF CS = '1' AND WR = '1' THEN
			mem(to_integer(unsigned(Address))) <= Data_in;
		END IF;
	END IF;
END PROCESS;

END behavioral;  