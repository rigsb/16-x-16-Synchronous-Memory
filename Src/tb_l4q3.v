module tbm ();
wire [15:0] op1,op2;
reg [15:0] ip;
reg [3:0] addr;
reg we,oe;
integer i,j;
reg clk=1;

memb tb2 (op1,ip,addr,we,oe,clk);
mems tb1 (op2,ip,addr,we,oe,clk);

always 
begin
 #5;  clk=~clk;
end

initial
begin
we=1; oe=0; addr=0; ip=0; #9
for (i=1; i<16; i=i+1)
begin
addr=i; ip=i; #10;
end
we=0; oe=1; addr=0; ip=0; #10
for (j=1; j<16; j=j+1)
begin
addr=j; ip=j; #10;
end
end
endmodule