library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        Neg             : out    vl_logic;
        aluClk          : in     vl_logic;
        Reset_A         : in     vl_logic;
        clk             : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        Reset_B         : in     vl_logic;
        B               : in     vl_logic_vector(7 downto 0);
        Enable_Decoder  : in     vl_logic;
        data_in         : in     vl_logic;
        FSM_reset       : in     vl_logic;
        OutA            : out    vl_logic_vector(3 downto 0);
        OutB            : out    vl_logic_vector(3 downto 0)
    );
end ALU;
