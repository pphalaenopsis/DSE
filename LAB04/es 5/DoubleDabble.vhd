library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY DoubleDabble IS 
PORT (
    bin: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    enable: in std_logic; -- same enable as up counter
    RST: IN STD_LOGIC;
    CLOCK: IN STD_LOGIC;
    BCD: OUT STD_LOGIC_VECTOR(19 DOWNTO 0)
);
END DoubleDabble;

ARCHITECTURE Behavior OF DoubleDabble IS

SIGNAL tmp_val_signal: UNSIGNED(35 downto 0) := (others => '0');


BEGIN
PROCESS(CLOCK,RST)
variable tmp_val_variable : UNSIGNED(35 downto 0);
BEGIN

if RST = '0' then
    tmp_val_signal <= (others=>'1');
elsif rising_edge(CLOCK) then
if enable = '1' then
tmp_val_variable := unsigned("00000000000000000000" & bin);
    if tmp_val_variable <= 9999 then
        for i in 0 to 14 loop
            tmp_val_variable := shift_left(tmp_val_variable, 1);
            -- check for each four bit
    	    if (tmp_val_variable(19 downto 16) >= "0101") then tmp_val_variable(19 downto 16) := tmp_val_variable(19 downto 16) + "0011"; 
	    end if;
            if (tmp_val_variable(23 downto 20) >= "0101") then tmp_val_variable(23 downto 20) := tmp_val_variable(23 downto 20) + "0011"; 
            end if;
            if (tmp_val_variable(27 downto 24) >= "0101") then tmp_val_variable(27 downto 24) := tmp_val_variable(27 downto 24) + "0011"; 
            end if;
            if (tmp_val_variable(31 downto 28) >= "0101") then tmp_val_variable(31 downto 28) := tmp_val_variable(31 downto 28) + "0011";
            end if;
            if (tmp_val_variable(35 downto 32) >= "0101") then tmp_val_variable(35 downto 32) := tmp_val_variable(35 downto 32) + "0011";
            end if;
        end loop;
        -- shift
        tmp_val_variable := shift_left(tmp_val_variable, 1);
        tmp_val_signal <= tmp_val_variable;
    else 
        tmp_val_signal <= "000010011001100110010000000000000000";
    end if;
    end if;
end if;
end process;
BCD <= std_logic_vector(tmp_val_signal(35 downto 16));
end Behavior;
