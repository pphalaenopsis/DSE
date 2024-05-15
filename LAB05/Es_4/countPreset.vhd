library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity countPreset is
port(
   en_in: in std_logic;
	clock: in std_logic;
	reset: in std_logic;
	count_out: out std_logic_vector(2 downto 0);
	disable: out std_logic
);
end countPreset;

architecture behavior of countPreset is

SIGNAL tmp_count: unsigned(2 downto 0);

BEGIN

process(clock, reset)
begin
    
	 if reset = '0' then
	    tmp_count <= (others => '0');
       disable <= '0';
	 elsif rising_edge(clock) then
	    if en_in = '1' then
		    if tmp_count <= 6 then
	          tmp_count <= tmp_count + 1;
				 disable <= '0';
			 else
			    disable <= '1';
				 tmp_count <= tmp_count;
			 end if;
       end if;	
	 end if;
end process;   
count_out <= std_logic_vector(tmp_count);
end behavior;