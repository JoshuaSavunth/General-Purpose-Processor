library verilog;
use verilog.vl_types.all;
entity ALU_vlg_check_tst is
    port(
        Neg             : in     vl_logic;
        OutA            : in     vl_logic_vector(3 downto 0);
        OutB            : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALU_vlg_check_tst;
