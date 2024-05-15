LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- work on the MSB of the result and of the operands
ENTITY overflow_detect IS
PORT(
  op1, op2, res: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  OUT_VAL: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END overflow_detect;

ARCHITECTURE behavior OF overflow_detect IS
BEGIN
PROCESS (op1, op2, res)
BEGIN
   -- operands both positive, result negative -> saturate to max positive
   IF op1(7) = '0' AND op1(7) = op2(7) and op1(7) /= res(7) then OUT_VAL <= "01111111";
	-- operands both negative, result positive -> saturate to max negative
	ELSIF op1(7) = '1' AND op1(7) = op2(7) and op1(7) /= res(7) then OUT_VAL <= "10000000";
	-- resplicate result to output
	ELSE OUT_VAL <= res;
   END IF;
END PROCESS;
END behavior;