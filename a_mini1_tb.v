module tb;
reg[7:0] a;

wire[2:0] s;
wire[2:0] c;


onectr oc1(a, s, c);
initial begin $dumpfile("dump_ripple.vcd");
$dumpvars(0,tb);
end

initial begin $monitor("value 1: %b  value 2: %b %b\n ",a,c[2],s);
a=8'b01101100;
#10;

end
endmodule

