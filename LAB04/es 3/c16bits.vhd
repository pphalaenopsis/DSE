library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity c16bits is
    port(
		 
        clock: in std_logic;
        reset: in std_logic;
        Q: out unsigned(15 DOWNTO 0)
    );
end c16bits;

architecture behavior of c16bits is


SIGNAL tmp : UNSIGNED(15 DOWNTO 0);
begin
    process(clock, reset)
    begin
		  
			  if reset = '0' then
					tmp <= (others => '0');
			  elsif rising_edge(clock) then
					tmp <= tmp +1;
			  end if; 	 
     end process;   
  Q <= tmp; 
end behavior;