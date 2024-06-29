library verilog;
use verilog.vl_types.all;
entity REG is
    port(
        ldata           : in     vl_logic_vector(511 downto 0);
        hdata           : in     vl_logic_vector(511 downto 0);
        wdata           : in     vl_logic_vector(511 downto 0);
        we              : in     vl_logic;
        re              : in     vl_logic;
        \select\        : in     vl_logic;
        clk             : in     vl_logic;
        add             : in     vl_logic_vector(1 downto 0);
        read_data       : out    vl_logic_vector(511 downto 0);
        a               : out    vl_logic_vector(511 downto 0);
        b               : out    vl_logic_vector(511 downto 0);
        s0              : out    vl_logic_vector(511 downto 0);
        s1              : out    vl_logic_vector(511 downto 0)
    );
end REG;
