library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY helloFSM IS
PORT (
    enable: IN STD_LOGIC;
	 clock: IN STD_LOGIC;
	 reset: IN STD_LOGIC;
	 
	 outLetter: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)	 
);
END helloFSM;

ARCHITECTURE behavior OF helloFSM IS

    TYPE state_type IS (blankDisplay, H, E, L1, L2, O);
    SIGNAL present_state : state_type;
    SIGNAL next_state : state_type;
	 SIGNAL enableNext: STD_LOGIC;
	 SIGNAL CLK: STD_LOGIC;
	 SIGNAL rst: STD_LOGIC;

BEGIN
    enableNext <= enable;
	 CLK <= clock;
	 rst <= reset;
	 
    PROCESS(CLK, rst)
    BEGIN
        IF rst = '0' THEN present_state <= blankDisplay; -- active low
        ELSIF rising_edge(CLK) THEN
            present_state <= next_state;
        END IF;
    END PROCESS;
	 

	 
    PROCESS(present_state, enableNext)
	 
    BEGIN
        CASE present_state IS
            	 
            WHEN H =>
                IF enableNext = '1' THEN next_state <= E;
                ELSE next_state <= present_state;
                END IF;
					 
				WHEN E =>
                IF enableNext = '1' THEN next_state <= L1;
                ELSE next_state <= present_state;
                END IF;
					 
				WHEN L1 =>
                IF enableNext = '1' THEN next_state <= L2;
                ELSE next_state <= present_state;
                END IF;
			   
				WHEN L2 =>
                IF enableNext = '1' THEN next_state <= O;
                ELSE next_state <= present_state;
                END IF;
					 
				WHEN O =>
                IF enableNext = '1' THEN next_state <= blankDisplay;
                ELSE next_state <= present_state;
                END IF;
					 
				WHEN blankDisplay =>
                IF enableNext = '1' THEN next_state <= H;
                ELSE next_state <= present_state;
                END IF;
				
				WHEN OTHERS =>
			       next_state <= blankDisplay; --default	
        END CASE;
    END PROCESS;

	 PROCESS (present_state)
	 BEGIN 
			CASE present_state is 
			
				WHEN H => outLetter <= "0001001";
				WHEN E => outLetter <= "0000110";	
				WHEN L1 => outLetter <= "1000111";
			        WHEN L2 => outLetter <= "1000111";	
				WHEN O => outLetter <= "1000000";
				WHEN blankDisplay => outLetter <= "1111111";
				WHEN OTHERS => outLetter <= "1111111";
			END CASE;
	 END PROCESS;

END behavior;