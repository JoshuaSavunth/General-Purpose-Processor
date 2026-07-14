LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;


entity ALU3Code is -- ALU unit includes Reg. 3
    port (
        clk    : in std_logic;
        A, B   : in unsigned(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in unsigned(15 downto 0); -- 8-bit opcode from Decoder
		  id 		: in std_logic_vector(3 downto 0);
        Result    : out std_logic
    );
end ALU3Code;

architecture calculation of ALU3Code is

begin
    process(clk)
    begin
        if rising_edge(clk) then
		  Result <= id(0);
        end if;
    end process;
end calculation;

