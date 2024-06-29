library verilog;
use verilog.vl_types.all;
entity CPU is
    port(
        \select\        : in     vl_logic_vector(1 downto 0);
        regnumber       : in     vl_logic_vector(1 downto 0);
        madd            : in     vl_logic_vector(8 downto 0);
        clk             : in     vl_logic;
        a               : out    vl_logic_vector(511 downto 0);
        b               : out    vl_logic_vector(511 downto 0);
        s0              : out    vl_logic_vector(511 downto 0);
        s1              : out    vl_logic_vector(511 downto 0);
        mem_out         : out    vl_logic_vector(511 downto 0);
        reg_out         : out    vl_logic_vector(511 downto 0)
    );
end CPU;
