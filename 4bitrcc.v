`timescale 1ns/1ps
module dff(q,qb,d,clk,rst);
output reg q,qb;
input d,clk,rst;
always @ (negedge clk or posedge rst)
 if(rst)
	q <= 1'b0;
 else
	q <= d;
endmodule
module tff(q,clk,rst);
output q;
input clk,rst;
wire din;
dff dff0 (q,qb,din,clk,rst);
not n1(din,q);
endmodule
module ripple_carry_counter(q,clk,rst);
output [3:0]q;
input clk,rst;
tff tff0 (q[0],clk,rst);
tff tff1 (q[1],q[0],rst);
tff tff2 (q[2],q[1],rst);
tff tff3 (q[3],q[2],rst);
endmodule
