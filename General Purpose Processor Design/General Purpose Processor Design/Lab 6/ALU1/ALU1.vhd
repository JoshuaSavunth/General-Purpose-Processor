LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

entity ALU1 is -- ALU unit includes Reg. 3
    port (
        clk    : in std_logic;
        A, B   : in unsigned(7 downto 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in unsigned(15 downto 0); -- 8-bit opcode from Decoder
        Neg    : out std_logic;
        R1, R2 : out unsigned(3 downto 0)
    );
end ALU1;

architecture calculation of ALU1 is
    signal Reg1, Reg2, Result : unsigned(7 downto 0) := (others => '0'); -- 8-bit Result
begin
    Reg1 <= A;
    Reg2 <= B;

    process(clk)
    begin
        if rising_edge(clk) then
            case opcode is
                when "0000000000000001" => -- Do addition for Reg1 and Reg2
                    Neg <= '0';
                    Result <= Reg1 + Reg2;

                when "0000000000000010" => -- Do subtraction for Reg1 and Reg2
                    if (Reg1 > Reg2) then
                        Neg <= '0';
                        Result <= Reg1 - Reg2;
                    else
                        Neg <= '1';
                        Result <= Reg2 - Reg1;
                    end if;

                when "0000000000000100" => -- Do inverse
                    Neg <= '0';
                    Result <= not Reg1;

                when "0000000000001000" => -- Do Boolean NAND
                    Neg <= '0';
                    Result <= not (Reg1 and Reg2);

                when "0000000000010000" => -- Do Boolean NOR
                    Neg <= '0';
                    Result <= not (Reg1 or Reg2);

                when "0000000000100000" => -- Do Boolean AND
                    Neg <= '0';
                    Result <= Reg1 and Reg2;

                when "0000000001000000" => -- Do Boolean XOR
                    Neg <= '0';
                    Result <= Reg1 xor Reg2;

                when "0000000010000000" => -- Do Boolean OR
                    Neg <= '0';
                    Result <= Reg1 or Reg2;

                when others => -- don't care, do nothing
                    Result <= (others => '0');
                    Neg <= '0';
            end case;
        end if;
    end process;

    -- Assigning 4-bit outputs
    R1 <= Result(3 downto 0); -- Lower 4 bits
    R2 <= Result(7 downto 4); -- Upper 4 bits
end calculation;

