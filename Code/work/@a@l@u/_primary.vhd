library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        se1             : in     vl_logic;
        se0             : in     vl_logic;
        a               : in     vl_logic_vector(511 downto 0);
        b               : in     vl_logic_vector(511 downto 0);
        s0              : out    vl_logic_vector(511 downto 0);
        s1              : out    vl_logic_vector(511 downto 0)
    );
end ALU;
