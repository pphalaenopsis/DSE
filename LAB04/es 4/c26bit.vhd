library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity c26bit is
port(
	clock: in std_logic;
	reset: in std_logic;
	Q: out unsigned(25 DOWNTO 0);
	en_out: out std_logic
);
end c26bit;

architecture behavior of c26bit is

SIGNAL count : UNSIGNED(25 DOWNTO 0);
SIGNAL tmp_en: std_logic := '0';

begin
process(clock, reset)
begin
	if reset = '0' then
        count <= (others => '0');
        tmp_en <= '0';
	    elsif rising_edge(clock) then
--		    if count= 49999999 then
            if count = 9 then
                count<=(others => '0');
                tmp_en <= '1';
            else
                count <= count +1;
                tmp_en <= '0';
            end if;	 
	end if; 	 
end process;   
Q <= count; 
en_out<= tmp_en;
end behavior;