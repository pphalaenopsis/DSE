LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY OneHotFSM IS 
PORT (
	SW: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- SW(1) -> w, SW(0) -> reset
	KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- KEY(0) -> clock
	
	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0) -- LEDR(0) -> Z
);
END OneHotFSM;

ARCHITECTURE structural OF OneHotFSM IS

TYPE state_type IS (A, B, C, D, E, F, G, H, I);
    SIGNAL present_state : state_type;
    SIGNAL next_state : state_type;
	 SIGNAL w: STD_LOGIC;
	 SIGNAL CLK: STD_LOGIC;
	 SIGNAL rst: STD_LOGIC;

BEGIN

    w <= SW(1);
	 CLK <= KEY(0);
	 rst <= SW(0);
	 
    PROCESS(CLK, rst)
    BEGIN
        IF rst = '0' THEN present_state <= A; -- active low
        ELSIF rising_edge(CLK) THEN
            present_state <= next_state;
        END IF;
    END PROCESS;

    PROCESS(present_state, w)
    BEGIN
        CASE present_state IS
            WHEN A =>
                IF w = '0' THEN next_state <= B;
                ELSE next_state <= F;
                END IF;
            WHEN B =>
                IF w = '0' THEN next_state <= C;
                ELSE next_state <= F;
                END IF;
				WHEN C =>
                IF w = '0' THEN next_state <= D;
                ELSE next_state <= F;
                END IF;
				WHEN D =>
                IF w = '0' THEN next_state <= E;
                ELSE next_state <= F;
                END IF;
				WHEN E =>
                IF w = '0' THEN next_state <= E;
                ELSE next_state <= F;
                END IF;
				WHEN F =>
                IF w = '1' THEN next_state <= G;
                ELSE next_state <= B;
                END IF;
				WHEN G =>
                IF w = '1' THEN next_state <= H;
                ELSE next_state <= B;
                END IF;
				WHEN H =>
                IF w = '1' THEN next_state <= I;
                ELSE next_state <= B;
                END IF;
				WHEN I =>
                IF w = '1' THEN next_state <= I;
                ELSE next_state <= B;
                END IF;
				WHEN OTHERS =>
			       next_state <= A; --default	
        END CASE;
    END PROCESS;

	 LEDR(9 DOWNTO 1) <= (others => '0');
    LEDR(0) <= '1' WHEN present_state = E OR present_state = I ELSE '0';
END structural;