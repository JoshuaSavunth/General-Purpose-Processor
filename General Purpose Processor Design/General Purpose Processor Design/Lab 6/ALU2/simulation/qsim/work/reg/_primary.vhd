library verilog;
use verilog.vl_types.all;
entity reg is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        res             : in     vl_logic;
        clk             : in     vl_logic;
        Q               : out    vl_logic_vector(7 downto 0)
    );
end reg;
