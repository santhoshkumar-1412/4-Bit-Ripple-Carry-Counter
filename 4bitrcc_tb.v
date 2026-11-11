`timescale 1ns/1ps
module bit4rcc_tb;
wire [3:0]q;
reg clk,rst;
ripple_carry_counter r1(q,clk,rst);
initial clk=1'b0;
always #10 clk=~clk;
initial 
begin
rst=1'b1;
#21 rst=1'b0;
#149 rst=1'b1;
#11 rst=1'b0;
#19 $finish;
end
initial 
begin
$dumpfile("4bitccdump.vcd");
$dumpvars(0,bit4rcc_tb);
end
initial $monitor($time,"Output q=%d",q);
endmodule
