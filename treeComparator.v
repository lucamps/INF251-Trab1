module maiorIgual2Bits (input [1:0] a,b, output M, output I)
assign M = a[1] & ~b[0]...;
assign I = ...;
endmodule

module maiorIgualArvore (input Me,Ie,Md,Id, output M, output I)
assign M = Me...;
assign I = ...;
endmodule

module arvore(input [7:0] a,b, output M,I)
wire m76,i76,m54,i54,m32,i32,m10,i10;
wire me, ie, md, id;

maiorIgual2Bits M76 (a[7:6], b[7:6], m76, i76);
maiorIgual2Bits M54 (a[5:4], b[5:4], m54, i54);
maiorIgualArvore A1 (m76, i76, m54, i54, me, ie);

maiorIgual2Bits M32 (a[3:2], b[3:2], m32, i32);
maiorIgual2Bits M10 (a[1:0], b[1:0], m10, i10);
maiorIgualArvore A2 (m32, i32, m10, i10, md, id);

maiorIgualArvore A3(me, ie , md, id, M, I);
endmodule