LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY masterCounter IS 
PORT(
		CLOCK: IN STD_LOGIC;
		RESET: IN STD_LOGIC;
		en_in: IN STD_LOGIC;    
		enable_reset: OUT std_logic;
      Q : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
);
END masterCounter;


-- incremented when all four operations are completed
-- such that it serve as address identifier for
-- both retrieval on memoryA and writing on memoryB

ARCHITECTURE behavior OF masterCounter IS

SIGNAL count : UNSIGNED(5 DOWNTO 0);
begin
process(clock, reset)
begin
	 if reset = '0' then
	   count <= (others => '0');
      enable_reset<='0';
	 elsif rising_edge(CLOCK) then
	 if en_in ='1' then
			 -- if count = 1023 then
			 if count = 63 then
			  count <= (others => '0');
			  enable_reset<='0';
			 else   
				count <= count + 1;
				enable_reset<='1';    
			 end if;
	  else
		    count <= count;
			 enable_reset<='0';
		end if;
	 end if;	 
end process;   
Q <= std_logic_vector(count);  
end behavior;