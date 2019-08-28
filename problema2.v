module S_baixoNivel (input [3:0] x, output [4:0] S);
    assign S[4] = (x[3]);
    assign S[3] = (x[3] & x[2]) | (x[3] & x[1]) | (x[2] & x[1]) | (x[2] & x[0]);
    assign S[2] = (~x[3] & x[2] & ~x[1] & ~x[0]) | (x[3] & ~x[2] & ~x[1]) | 
            (~x[3] & ~x[2] & x[1]) | (~x[3] & ~x[2] & x[0]) | (x[3] & x[2] & x[1]);
    assign S[1] = (x[2] & ~x[1] & ~x[0]) | (~x[3] & x[1] & x[0]) | (x[3] & ~x[1]);
    assign S[0] = (~x[3] & x[2] & ~x[0]) | (~x[3] & x[1] & ~x[0]) | (x[3] & x[0]);
endmodule

module S_autoNivel (input [3:0] x, output [4:0] S);
    assign S = (x[3] == 1)? ((x-2)+5'b10000): (x+3);    
endmodule

//testbench
module testbench();
    reg [3:0] x;
    wire [4:0] S1,S2;
    integer i;

    S_baixoNivel teste(x, S1);
    S_autoNivel teste2(x, S2);

    initial begin
        x = 4'b0000; #1;     
        $monitor("%d     x %b          S1 %b  S2 %b", i, x, S1, S2);  //impressao
        for (i=1; i<16; i=i+1) begin
            x = x + 8'b0001; #1;   
            if ( S1 != S2  ) $display("FALHA");
        end
    end
endmodule
