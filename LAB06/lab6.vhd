LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY lab6 IS
PORT (
	CLK,RST: IN STD_LOGIC;
	data_in: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Start: IN STD_LOGIC;
	DONEout: OUT STD_LOGIC
);
END lab6;

ARCHITECTURE structure OF lab6 IS

-- components
COMPONENT datapath IS
PORT ( enable_counter3b,CLK,RST,start,increment,sel_z: IN std_logic;
       data_in1: IN std_logic_vector(7 downto 0);
       en_write: OUT std_logic;
		 address: OUT std_logic_vector(5 downto 0); 
		 data_out1: OUT std_logic_vector(7 downto 0)
		 );
END COMPONENT;

COMPONENT control_unit is
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
end COMPONENT;

COMPONENT memoryB IS
PORT (
   Data_in: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Address: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	CS, CLK, WR, RD: IN STD_LOGIC
);
END COMPONENT;

COMPONENT memoryA IS
PORT (
   Data_in: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Address: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	CS, CLK, WR, RD: IN STD_LOGIC;
   Data_out: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END COMPONENT;

-- signals

SIGNAL CSAo, CSBo, WRAo, WRBo, RDAo, RDBo, z1,en_writeb, en_3bit, increment_mc: STD_LOGIC;
signal Data_out_ma,data_inb: std_logic_vector(7 downto 0);
signal addressOut: std_logic_vector( 5 downto 0);



BEGIN

memA: memoryA PORT MAP (data_in, addressOut, CSAo, CLK, WRAo, RDAo, Data_out_ma);
cu: control_unit PORT MAP(CLK, RST, Start, en_writeb, addressOut, increment_mc, DONEout,en_3bit, CSAo, CSBo, WRAo, WRBo, RDAo, RDBo,z1);
data: datapath PORT MAP(en_3bit,CLK, RST, Start, increment_mc, z1, Data_out_ma, en_writeb, addressOut,data_inb);
memB: memoryB PORT MAP(data_inb, ADDRESSout, CSBo, CLK, WRBo, RDBo);

END structure;