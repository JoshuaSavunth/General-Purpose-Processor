LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY sseg2 IS
	PORT (bcd :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			leds:OUT STD_LOGIC_VECTOR(1 TO 7));
END sseg2;

ARCHITECTURE Behavior OF sseg2 IS
BEGIN
	WITH bcd SELECT ---abcdefg
		  leds	<=	  "0000001" WHEN "0000", --0
						  "1001111" WHEN "0001", --1
						  "0010010" WHEN "0010", --2
						  "0000110" WHEN "0011", --3
						  "1001100" WHEN "0100", --4
						  "0100100" WHEN "0101", --5
						  "0100000" WHEN "0110", --6
						  "0001111" WHEN "0111", --7
						  "-------" WHEN OTHERS;
END Behavior;
