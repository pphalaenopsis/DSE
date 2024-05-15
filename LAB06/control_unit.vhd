library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity control_unit is
Port ( 
	CLK, RST, START : in STD_LOGIC;
	done_counter3b: in std_logic;
	-- status flags from datapath
	ADDRESS_COUNT: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	
   increment_address: OUT std_logic;
	DONE : out STD_LOGIC;
	en_counter3bits: out std_logic;
	CS_A, CS_B, WR_A, WR_B, RD_A, RD_B, z : out STD_LOGIC
);
end control_unit;

architecture behavior of control_unit is

type state_type is (IDLE, LOAD_A, LOAD_B, END_state);
signal present_state, next_state: state_type;

begin

PROCESS(CLK, RST)
    BEGIN
        IF RST = '0' THEN present_state <= IDLE; -- active low
        ELSIF rising_edge(CLK) THEN
            present_state <= next_state;
    END IF;
END PROCESS;

process(present_state, START, ADDRESS_COUNT, done_counter3b)
    begin
			case present_state is
				 when IDLE =>
					  CS_A <= '0';
					  WR_A <= '0';
					  RD_A <= '0';
					  CS_B <= '0';
					  WR_B <= '0';
					  RD_B <= '0';
					  DONE <= '0';
					  z<= '0';
					  en_counter3bits<='0';
					  increment_address<='0';
					  -- Transition to LOAD_A state when START signal is detected
					  if START = '1' then
					      CS_A <= '1';
					      WR_A <= '1'; -- Start writing to MEM_A
					      RD_A <= '0';
							next_state <= LOAD_A;
					  else
							next_state <= present_state;
					  end if;

				 when LOAD_A =>
					  CS_A <= '1';
					  WR_A <= '1'; -- Start writing to MEM_A
					  RD_A <= '0';
					  CS_B <= '0';
					  WR_B <= '0';
					  RD_B <= '0';
					  DONE <= '0';
					  en_counter3bits<='0';
					  increment_address<='0';
					  z<='0';
					  --if unsigned(ADDRESS_COUNT, 10) < 1023 then
					  if unsigned(ADDRESS_COUNT) < 63 then
							next_state <= present_state;
					  else
							-- memory A all loaded, move to next state
							next_state <= LOAD_B;
					  end if;
				 when LOAD_B =>
					  CS_A <= '1';
					  WR_A <= '0'; -- Start writing to MEM_A
					  RD_A <= '1';
					  DONE <= '0';
					  CS_B <= '0';
					  WR_B<='0';
					  RD_B<='0';
					  en_counter3bits<='1';
					  z<='1';
					  if unsigned(ADDRESS_COUNT) < 63 then
					      if done_counter3b= '1' then
					        CS_B <= '1';
						     increment_address<='1';
						     WR_B<='1';
						     RD_B<='0';
					     else 
						     increment_address<='0';
						     CS_B<='0';
							  RD_B<='0';
						     WR_B<='0';
						  end if;
						  next_state <= present_state;
					  else
					     if done_counter3b= '1' then
					        CS_B <= '1';
							  increment_address<='1';
						     WR_B<='1';
						     RD_B<='0';
							  next_state <= END_state;
					     else 
						     increment_address<='0';
						     CS_B<='0';
							  RD_B<='0';
						     WR_B<='0';
							  next_state <= present_state;
						  end if;
					  end if;
				 when END_state =>
					  CS_A <= '0';
					  WR_A <= '0'; -- Start writing to MEM_A
					  RD_A <= '0';
					  CS_B <= '0';
					  WR_B <= '0';
					  RD_B <= '0';
					  DONE <= '1';
					  increment_address<='0';
					  z<='0';
					  en_counter3bits<='0';
					  
					  next_state <= IDLE;
				 when others => 
					  next_state <= IDLE;
			end case;
    end process;
end behavior;
