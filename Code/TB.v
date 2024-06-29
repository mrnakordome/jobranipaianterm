module TB();

reg[1:0] select;
reg[1:0] regnumber;
reg[8:0] madd;
wire [511:0] mem;
wire [511:0] register;
reg clk;
wire [511:0] a;
wire [511:0] b;
wire [511:0] s0;
wire [511:0] s1;
CPU cpu1(select, regnumber, madd, clk, a, b, s0, s1, mem, register);
initial
    clk = 0;

always
    #1 clk = ~clk;

initial begin
    #2 select = 2'b00; 
        regnumber = 2'b00;
        madd = 278;
    #2 select = 2'b00; 
        regnumber = 2'b01;
        madd = 345;
    #2 select = 2'b10; 
    #2 select = 2'b11; 
    #2 select = 2'b00; 
        regnumber = 2'b00;
        madd = 1;
    #2 select = 2'b00; 
        regnumber = 2'b01;
        madd = 1;
    #2 select = 2'b11; 
    #2 select = 2'b00; 
        regnumber = 2'b01;
        madd = 17;
    #2 select = 2'b11; 
    #2 select = 2'b10; 
    #2 select = 2'b00; 
        regnumber = 2'b00;
        madd = 33;
    #2 select = 2'b10; 
    #2 select = 2'b11; 
    #50 $stop;
end

initial begin
    $monitor($time , "\na: %h", a, "\nb: %h", b, "\ns0: %h", s0, "\ns1: %h", s1);
end

endmodule
