LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY datapath IS
PORT ( enable_counter3b,CLK,RST,start,increment,sel_z: IN std_logic;
       data_in1: IN std_logic_vector(7 downto 0);
       en_write: OUT std_logic;
		 address: OUT std_logic_vector(5 downto 0); 
		 data_out1: OUT std_logic_vector(7 downto 0)
		 );
       

END datapath;

ARCHITECTURE behavior OF datapath IS

-- components
COMPONENT overflow_detect IS
PORT(
  op1, op2, res: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  OUT_VAL: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

COMPONENT first8bitregs IS
GENERIC ( N : integer:= 8);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn : IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END COMPONENT;

COMPONENT shifter_double IS
GENERIC ( N : integer:= 8);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn: IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END COMPONENT;

COMPONENT shifter_quarter IS
GENERIC ( N : integer:= 8);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn: IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END COMPONENT;

COMPONENT shifter_four IS
GENERIC ( N : integer:= 8);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn: IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END COMPONENT;

COMPONENT shifter_half IS
GENERIC ( N : integer:= 8);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn: IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END COMPONENT;

COMPONENT adder IS
PORT (
  OP1, OP2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  CIN: IN STD_LOGIC;
  RES: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  CARRY: OUT STD_LOGIC 
);
END COMPONENT;

COMPONENT register8bit IS
GENERIC ( N : integer:= 8);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn : IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END COMPONENT;

COMPONENT masterCounter IS 
PORT(
		CLOCK: IN STD_LOGIC;
		RESET: IN STD_LOGIC;
		en_in: IN STD_LOGIC;    
		enable_reset: OUT std_logic;
      Q : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
);
END COMPONENT;

COMPONENT mux IS
PORT (
  reg1, reg2, reg3, reg4,default: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  z: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
  CHOICE: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

COMPONENT mux_reg IS
PORT (
  current, prec_reg: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  z: IN STD_LOGIC;
  CHOICE: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

COMPONENT counter3bit is
port(
  en_start_cu: IN STD_LOGIC;   
  clock, reset: IN STD_LOGIC;
  countOut: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
  enable_mux, enable_write: OUT std_logic
);
end COMPONENT;

COMPONENT mux_address IS
PORT (
  start1, finish_cycle: IN std_logic;
  z: IN STD_LOGIC;
  choice: OUT STD_LOGIC
);
END COMPONENT;


-- signals
signal incr_addr,en_reset,c_out,en_mux,reset_reg8bit,c_in: std_logic;
signal add1,result,result_overf: std_logic_vector(7 downto 0);
signal track_count: std_logic_vector(2 downto 0);
signal outreg1,outreg2,outreg3,outreg4,inreg1, inreg2, inreg3,inreg4: std_logic_vector(7 downto 0);
signal outsh1, outsh2,outsh3,outsh4: std_logic_vector(7 downto 0);
signal sumHold: std_logic_vector(7 downto 0);
BEGIN

count3b: counter3bit PORT MAP (enable_counter3b,CLK,RST,track_count,en_mux,en_write);
muxMaster: mux_address PORT MAP (start, increment, sel_z, incr_addr);

masterC: masterCounter PORT MAP(CLK,RST, incr_addr, en_reset,address);
reset_reg8bit<=not(en_reset and RST);




MUX1: mux_reg PORT MAP(outreg1, DATA_IN1, en_mux, inreg1);
reg1: first8bitregs PORT MAP(inreg1, CLK, RST, outreg1);
sh1: shifter_half PORT MAP(outreg1, CLK, RST, outsh1);

MUX2: mux_reg PORT MAP(outreg2, outreg1, en_mux, inreg2);
reg2: first8bitregs PORT MAP(inreg2, CLK, RST, outreg2);
sh2: shifter_double PORT MAP(outreg2, CLK, RST, outsh2);

MUX3: mux_reg PORT MAP(outreg3, outreg2, en_mux, inreg3);
reg3: first8bitregs PORT MAP(inreg3, CLK, RST, outreg3);
sh3: shifter_four PORT MAP(outreg3, CLK, RST, outsh3);

MUX4: mux_reg PORT MAP(outreg4, outreg3, en_mux, inreg4);
reg4: first8bitregs PORT MAP(inreg4, CLK, RST, outreg4);
sh4: shifter_quarter PORT MAP(outreg4, CLK, RST, outsh4);

muxone: mux PORT MAP(outsh1,outsh2,outsh3,outsh4,"00000000",track_count,add1);

c_in<= '0';
addSum: adder PORT MAP(add1,sumHold, c_in, result, c_out);
overDetect: overflow_detect PORT MAP(add1,sumHold, result, result_overf);
reg8bit: register8bit PORT MAP(result_overf,CLK,reset_reg8bit,sumHold);
data_out1<=sumHold;

END behavior;