module REG (
    input [511:0] ldata,
    input [511:0] hdata,
    input [511:0] wdata,
    input we,
    input re,
    input select,
    input clk,
    input [1:0] add,
    output reg [511:0] read_data,
    output reg [511:0] a,
    output reg [511:0] b,
    output reg [511:0] s0,
    output reg [511:0] s1
);

    reg signed [511:0] rega, regb, regs0, regs1;

    always @(*) begin
        if (re) begin
            if (add == 2'b00)
                read_data = rega;
            else if (add == 2'b01)
                read_data = regb;
            else if (add == 2'b10)
                read_data = regs0;
            else if (add == 2'b11)
                read_data = regs1;
        end
        else if (we) begin
            if (add == 2'b00)
                rega <= wdata;
            else if (add == 2'b01)
                regb <= wdata;
            else if (add == 2'b10)
                regs0 <= wdata;
            else if (add == 2'b11)
                regs1 <= wdata;
        end
        else if (select) begin
            regs0 = ldata;
            regs1 = hdata;
        end

        a = rega;
        b = regb;
        s0 = regs0;
        s1 = regs1;
    end

    initial begin
        rega = 0;
        regb = 0;
        regs0 = 0;
        regs1 = 0;
    end

endmodule
