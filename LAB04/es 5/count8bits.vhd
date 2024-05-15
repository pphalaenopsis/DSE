LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- counter 8 bits
-- performs the downcount of n seconds 
-- after which the ledr and the displays
-- turn on

ENTITY count8bits IS 
PORT(
		START: IN UNSIGNED(7 DOWNTO 0);
		en_in: IN STD_LOGIC;
		CLOCK: IN STD_LOGIC;
		RESET: IN STD_LOGIC;
      Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		en_out: OUT STD_LOGIC
);
END count8bits;


ARCHITECTURE behavior OF count8bits IS

SIGNAL count : UNSIGNED(7 DOWNTO 0);
SIGNAL tmp_en: std_logic := '0';

begin

process(clock, reset)
begin

	 if reset = '0' then
	    count <= START;
	    tmp_en <= '0';	
	 elsif rising_edge(CLOCK) then
	        
			  if en_in = '1' then 
		        if count = 0 then
		           tmp_en <= '1';
					  count <= START;
	           else
		           count <= count - 1;
 
		
		
	  end if;		   
	  end if;	 
	  end if;	

end process;   
Q <= std_logic_vector(count); 
en_out <= tmp_en;
       
end behavior;