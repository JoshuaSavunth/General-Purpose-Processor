LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY sseg2 IS
	PORT (bcd :IN STD_LOGIC;
			leds:OUT STD_LOGIC_VECTOR(1 TO 7));
END sseg2;

ARCHITECTURE Behavior OF sseg2 IS
BEGIN
Process(bcd)
	BEGIN
	if (bcd = '1') then
		leds <= "1000100";
	else
		leds <= "1101010";
	end if;
end Process;
END Behavior;
