module D_FF(
    input clk,
    input D,
    output reg Q,
    output reg QNot
);
    always @ (posedge clk)
    begin
    Q<=D;
    QNot<=~Q;
    end
    
endmodule