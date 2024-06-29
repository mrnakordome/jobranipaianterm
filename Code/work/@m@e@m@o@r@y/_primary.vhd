library verilog;
use verilog.vl_types.all;
entity MEMORY is
    port(
        madd            : in     vl_logic_vector(8 downto 0);
        we              : in     vl_logic;
        re              : in     vl_logic;
        clk             : in     vl_logic;
        din             : in     vl_logic_vector(511 downto 0);
        dout            : out    vl_logic_vector(511 downto 0)
    );
end MEMORY;
