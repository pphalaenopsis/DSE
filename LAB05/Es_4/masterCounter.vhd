library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity masterCounter is
port(
	clock: in std_logic;
	reset: in std_logic;
	en_out: out std_logic
);
end masterCounter;

architecture behavior of masterCounter is


SIGNAL count : UNSIGNED(25 DOWNTO 0);
SIGNAL tmp_en: std_logic;

BEGIN

process(clock, reset)
begin
    
	 if reset = '0' then
	    count <= (others => '0');
		 tmp_en <= '0';
    
	 elsif rising_edge(clock) then
	    -- if count = 49999999
		 if count = 9 then 
			 count  <= (others => '0');
			 tmp_en <= '1';
		 else
			 count <= count + 1;
			 tmp_en <= '0';
		 end if;	 
	 end if;
	 
end process;   
en_out <= tmp_en;
end behavior;