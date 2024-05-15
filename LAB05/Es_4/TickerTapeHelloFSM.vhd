LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY TickerTapeHelloFSM IS 
PORT (
	KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- KEY(0) -> reset
	CLOCK_50: IN STD_LOGIC; -- clock
	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT STD_LOGIC_VECTOR( 6 DOWNTO 0) 
);
END TickerTapeHelloFSM;

Architecture structural of TickerTapeHelloFSM IS

-- components
COMPONENT helloFSM IS
PORT (
    enable: IN STD_LOGIC;
	 clock: IN STD_LOGIC;
	 reset: IN STD_LOGIC;
	 
	 outLetter: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)	 
);
END COMPONENT;
		 		
COMPONENT masterCounter IS 
port(
	clock: in std_logic;
	reset: in std_logic;
	en_out: out std_logic
);
end COMPONENT;

COMPONENT register7bit IS
GENERIC ( N : integer:= 7);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn, en_in: IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END COMPONENT;


COMPONENT mux IS
PORT (
  inValue, regValue : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
  z: IN STD_LOGIC;
  selected: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END COMPONENT;

COMPONENT encodeSel IS
PORT (
  en_in: IN STD_LOGIC;
  clock, reset: IN STD_LOGIC;
  toEncode: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
  encoded: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
);
END COMPONENT;

COMPONENT countPreset is
port(
   en_in: in std_logic;
	clock: in std_logic;
	reset: in std_logic;
	count_out: out std_logic_vector(2 downto 0);
	disable: out std_logic
);
end COMPONENT;

--signals

SIGNAL sel0, sel1, sel2, sel3, sel4, sel5:  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL out0, out1, out2, out3, out4, out5:  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL fsm_out : std_logic_vector(6 DOWNTO 0);
SIGNAL en_out, en_preset, en_block: std_logic;
SIGNAL count: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL enableMux: STD_LOGIC_VECTOR(5 DOWNTO 0);

begin 

enable_sig: masterCounter PORT MAP(Clock_50, KEY(0), en_out);

en_block <= not en_preset and en_out;
presetPhase: countPreset PORT MAP(en_block, Clock_50, KEY(0), count, en_preset);
enableState: encodeSel PORT MAP(en_block, Clock_50, KEY(0), count, enableMux);

finiteHELLO: helloFSM PORT MAP(en_out, Clock_50, KEY(0), fsm_out);

mux0: mux PORT MAP (fsm_out, out5, enableMux(0), sel0); -- "1111111"
reg0: register7bit PORT MAP(sel0 ,Clock_50, KEY(0), en_out, out0);

mux1: mux PORT MAP (out0, "1111111", enableMux(1), sel1);
reg1: register7bit PORT MAP (sel1 ,Clock_50, KEY(0), en_out, out1);

mux2: mux PORT MAP (out1, "1111111", enableMux(2), sel2);
reg2: register7bit PORT MAP (sel2 ,Clock_50, KEY(0), en_out, out2);

mux3: mux PORT MAP (out2, "1111111",enableMux(3), sel3);
reg3: register7bit PORT MAP (sel3 ,Clock_50, KEY(0), en_out, out3);
 
mux4: mux PORT MAP (out3, "1111111", enableMux(4), sel4);
reg4: register7bit PORT MAP (sel4 ,Clock_50, KEY(0), en_out, out4);

mux5: mux PORT MAP (out4, "1111111", enableMux(5), sel5);
reg5: register7bit PORT MAP (sel5 ,Clock_50, KEY(0), en_out, out5);

HEX5 <= out5;
HEX4 <= out4;
HEX3 <= out3;
HEX2 <= out2;
HEX1 <= out1;
HEX0 <= out0;

end structural;