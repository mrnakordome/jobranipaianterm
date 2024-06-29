module CPU (
    input [1:0] select,
    input [1:0] regnumber,
    input [8:0] madd,
    input clk,
    output reg [511:0] a,
    output reg [511:0] b,
    output reg [511:0] s0,
    output reg [511:0] s1,
    output reg [511:0] mem_out,
    output reg [511:0] reg_out
);
    reg se0, se1;
    reg reg_we, reg_re;
    reg controller;
    reg mem_we, mem_re;
    wire [511:0] rega;
    wire [511:0] regb;
    wire [511:0] regs0;
    wire [511:0] regs1;
    wire [511:0] alus0;
    wire [511:0] alus1;
    wire [511:0] din;
    wire [511:0] dout;
    REG reg1 (alus0, alus1, dout, reg_we, reg_re, controller, clk, regnumber, din, rega, regb, regs0, regs1);
    ALU alu1 (se1, se0, a, b, alus0 , alus1);
    MEMORY memory (madd, mem_we, mem_re, clk, din, dout);
    always @(*) begin
        if (select == 2'b00) begin
            mem_re = 1;
            mem_we = 0;
            reg_we = 1;
            reg_re = 0;
            controller = 0;
            se0 = 0;
            se1 = 0;
        end
        else if (select == 2'b01) begin 
            reg_we = 0;
            reg_re = 1;
            mem_re = 0;
            mem_we = 1;
            controller = 0;
            se1 = 1;
            se0 = 0;
        end
        else if (select == 2'b10) begin 
            se1 = 1;
            se0 = 0;
            mem_re = 0;
            mem_we = 0;
            reg_we = 0;
            reg_re = 0;
            controller = 1;
        end
        else if (select == 2'b11) begin 
            se1 = 1;
            se0 = 1;
            mem_re = 0;
            mem_we = 0;
            reg_we = 0;
            reg_re = 0;
            controller = 1;
        end
        a = rega;
        b = regb;
        s0 = regs0;
        s1 = regs1;
        mem_out = dout;
        reg_out = din;
    end

endmodule
