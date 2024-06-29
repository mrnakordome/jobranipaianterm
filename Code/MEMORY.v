module MEMORY (
    input [8:0] madd,
    input we,
    input re,
    input clk,
    input [511:0] din,
    output reg [511:0] dout

);
reg [8:0] add;
reg [31:0] ram [0:511];

integer i;

always @(*) begin
    add = madd;

    if (re) begin
        add = add - (add%512);
        for (i = 0; i < 16; i = i + 1) begin
            dout[i*32 +: 32] = ram[add];
            add = add + 1;
        end
    end

    else if (we) begin
        add = add - (add%512);
        for (i = 0; i < 16; i = i + 1) begin
            ram[add + i] = din[i*32 +: 32];
            add = add + 1;
        end
    end
end

initial begin
    for (i = 0; i < 512; i = i + 1) begin
    if (i % 16 == 0) begin
        ram[i] = 32'hFFFFFFF0;
    end else if (i % 16 == 1) begin
        ram[i] = 32'hFFFFFFF1;
    end else if (i % 16 == 2) begin
        ram[i] = 32'hFFFFFFF2;
    end else if (i % 16 == 3) begin
        ram[i] = 32'hFFFFFFF3;
    end else if (i % 16 == 4) begin
        ram[i] = 32'hFFFFFFF4;
    end else if (i % 16 == 5) begin
        ram[i] = 32'hFFFFFFF5;
    end else if (i % 16 == 6) begin
        ram[i] = 32'hFFFFFFF6;
    end else if (i % 16 == 7) begin
        ram[i] = 32'hFFFFFFF7;
    end else if (i % 16 == 8) begin
        ram[i] = 32'hFFFFFFF8;
    end else if (i % 16 == 9) begin
        ram[i] = 32'hFFFFFFF9;
    end else if (i % 16 == 10) begin
        ram[i] = 32'hFFFFFFFA;
    end else if (i % 16 == 11) begin
        ram[i] = 32'hFFFFFFFB;
    end else if (i % 16 == 12) begin
        ram[i] = 32'hFFFFFFFC;
    end else if (i % 16 == 13) begin
        ram[i] = 32'hFFFFFFFD;
    end else if (i % 16 == 14) begin
        ram[i] = 32'hFFFFFFFE;
    end else if (i % 16 == 15) begin
        ram[i] = 32'hFFFFFFFF;
    end
end
    for (i = 1; i < 17; i = i + 1) begin
        ram[i] = 32'hFFFFFFFF;
    end
    for (i = 17; i < 33; i = i + 1) begin
        ram[i] = 32'h00000001;
    end

    for (i = 33; i < 49; i = i + 1) begin
        ram[i] = 32'h7FFFFFFF;
    end
end


endmodule


