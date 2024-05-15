library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter16bit is
    port(
		  enable: in std_logic;
		  onoff: in std_logic;
        clock: in std_logic;
        reset: in std_logic;
        led_on: out std_logic;
        Q: out STD_LOGIC_VECTOR(15 DOWNTO 0)
    
    );
end counter16bit;

architecture behavior of counter16bit is


SIGNAL tmp : UNSIGNED(15 DOWNTO 0);
SIGNAL tmp_led: std_logic;
begin
    process(clock, reset)
    begin
		  
			  if reset = '0' then
					tmp <= (others => '0');
					tmp_led <= '0';
			  elsif rising_edge(clock) then
					if (enable = '1' and onoff = '1') then
						tmp <= tmp +1;
						tmp_led <= '1';
					end if;
			  end if; 	 
     end process;   
  Q <= STD_LOGIC_VECTOR(tmp); 
  led_on <= tmp_led;
end behavior;