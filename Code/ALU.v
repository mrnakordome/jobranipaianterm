module ALU (   
    input se1,
    input se0,
    input signed [511:0] a,
    input signed [511:0] b,
    output reg [511:0] s0,
    output reg [511:0] s1
);

reg signed [63:0] res;
integer i = 0;

always @(*) begin
        if (se1) begin
            for (i = 0; i < 16; i = i + 1) begin
                if (!se0) begin
                    res = $signed(a[i*32 +: 32]) + $signed(b[i*32 +: 32]);
                    s0[i*32 +: 32] = res[31:0];
                    s1[i*32 +: 32] = 32'h00000000;
                end
                else if(se0) begin
                    res = $signed(a[i*32 +: 32]) * $signed(b[i*32 +: 32]);
                    s0[i*32 +: 32] = res[31:0];
                    s1[i*32 +: 32] = res[63:32];
                end
                
            end
        end
    end

endmodule

