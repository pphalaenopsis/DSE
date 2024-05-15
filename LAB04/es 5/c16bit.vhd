library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity c16bit is
port(
	clock: in std_logic;
	reset: in std_logic;
	en_out: out std_logic
);
end c16bit;

architecture behavior of c16bit is


SIGNAL count : UNSIGNED(15 DOWNTO 0);
SIGNAL tmp_en: std_logic;

BEGIN

process(clock, reset)
begin
    
	 if reset = '0' then
	    count <= (others => '0');
		 tmp_en <= '0';
    
	 elsif rising_edge(clock) then
	 -- if count = 49999 then
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