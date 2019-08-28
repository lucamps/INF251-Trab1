module S_baixoNivel (input [3:0] x, output [4:0] S);
    assign S[4] = (x[3]);
    assign S[3] = (x[3] & x[2]) | (x[3] & x[1]) | (x[2] & x[1]) | (x[2] & x[0]);
    assign S[2] = (~x[3] & x[2] & ~x[1] & ~x[0]) | (x[3] & ~x[2] & ~x[1]) | 
            (~x[3] & ~x[2] & x[1]) | (~x[3] & ~x[2] & x[0]) | (x[3] & x[2] & x[1]);
    assign S[1] = (x[2] & ~x[1] & ~x[0]) | (~x[3] & x[1] & x[0]) | (x[3] & ~x[1]);
    assign S[0] = (~x[3] & x[2] & ~x[0]) | (~x[3] & x[1] & ~x[0]) | (x[3] & x[0]);
endmodule

/*module S_autoNivel (input [3:0] x, output [4:0] S);
    if (x<0) begin
        S = x-2;
    end 
    else begin
        S = x+3;
    end
endmodule*/

//testbench
module testbench();
    reg [3:0] x;
    wire [4:0] S;
    integer i;

    S_baixoNivel teste(x, S);

    initial begin
        x = 4'b0000; #1;
        
        $monitor("%d     x %b          S %b", i, x, S);  //impressao
        
        for (i=1; i<16; i=i+1) begin
            x = x + 8'b0001; #1;
            
            //if ( (a>b & M==0) | (a==b & I==0) | (a<b & (M==1 | I == 1)) ) $display("FALHA");
            //Caso o programa entre em algumas destas condicoes, aparecera' uma mensagem de erro
            
        end
    end
endmodule
