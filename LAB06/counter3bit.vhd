library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter3bit is
port(
  en_start_cu: IN STD_LOGIC;   --enable generale che parte quando ho finito di caricare la memA
  clock, reset: IN STD_LOGIC;
  countOut: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
  enable_mux, enable_write: OUT std_logic
);
end counter3bit;

architecture behavior of counter3bit is
SIGNAL count : UNSIGNED(2 DOWNTO 0);

BEGIN

process(clock, reset)
begin
    
	 if reset = '0' then
		 count  <= (others => '0');
       enable_mux <= '0';
		 enable_write<='0';
	 elsif rising_edge(clock) THEN
	   if en_start_cu='1' then
		
		  if count = 0 then  
		     enable_mux<= '1';
			  enable_write<='0';
			  count<=count+1;
			 --invio la write e csb
			 
		  elsif count= 6 then
		  enable_write<='1';  
		  enable_mux<='0';
		  count  <= (others => '0');
		  
	     else
			 count <= count + 1;
			enable_write<='0';  
		   enable_mux<='0';
			 
		  end if;
		end if;  
     else 
	      count<=count;
	  end if;
	  
	 
end process;
countOut<=std_logic_vector(count);

end behavior;