LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;


entity ALU2 is -- ALU unit includes Reg. 3
    port (
        clk    : in std_logic;
        A, B   : in unsigned(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in unsigned(15 downto 0); -- 8-bit opcode from Decoder
        Neg    : out std_logic;
        R1, R2 : out unsigned(3 downto 0)
    );
end ALU2;

architecture calculation of ALU2 is
    signal Reg1, Reg2, Result : unsigned(7 downto 0) := (others => '0');
	 signal flip : unsigned(0 to 7);
begin
    Reg1 <= A;
    Reg2 <= B;

    process(clk)
    begin
        if rising_edge(clk) then
            case opcode is
                when "0000000000000001" => -- Increment A by 2
                    Result <= Reg1 + "10";

                when "0000000000000010" => -- Shift B to the right by two bits  
                    Result<= shift_right(Reg2, 2);

                when "0000000000000100" => -- Shift A to the right by four bits
                    Result <= shift_right(Reg1, 4);

                when "0000000000001000" => -- Find the smaller value of A or B
							if (Reg1 < Reg2) then
								Result <= Reg1;
							else 
								Result <= Reg2;
							end if;
                when "0000000000010000" => -- Rotate A by two bits
							Result <= rotate_right(Reg1, 2);

                when "0000000000100000" => -- Reverse bits of B
							Result(0) <= Reg2(7);
							Result(1) <= Reg2(6);
							Result(2) <= Reg2(5);
							Result(3) <= Reg2(4);
							Result(4) <= Reg2(3);
							Result(5) <= Reg2(2);
							Result(6) <= Reg2(1);
							Result(7) <= Reg2(0);
                when "0000000001000000" => -- Do Boolean XOR
                    Neg <= '0';
                    Result <= Reg1 xor Reg2;

                when "0000000010000000" => -- Add A & B and then subtract 4.
                    if (Reg1 + Reg2 >= 4) then
                        Neg <= '0';
                        Result <= (Reg2 + Reg1) - 4;
                    else
                        Neg <= '1';
                        Result <= 4 - (Reg1 + Reg2);
                    end if;

                when others => -- don't care, do nothing
                    Result <= (others => '0');
                    Neg <= '1';
            end case;
        end if;
    end process;

    -- Assigning 4-bit outputs
    R1 <= Result(3 downto 0); -- Lower 4 bits
    R2 <= Result(7 downto 4); -- Upper 4 bits
end calculation;

