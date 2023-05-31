module full_adder(input a,b,cin,output wire s,c);
wire a1=a^b;
wire a2=a&b;
wire a3=a1&cin;
assign s=a1^cin;
assign c=a2|a3;
endmodule


module b2_pa(input wire[1:0] a,b,input wire cin,output wire[1:0] s,c);
full_adder f0(.a(a[0]),.b(b[0]),.cin(cin),.s(s[0]),.c(c[0]));
full_adder f1(.a(a[1]),.b(b[1]),.cin(c[0]),.s(s[1]),.c(c[1]));
endmodule



module b3_pa(input wire[2:0] a,b,input wire cin,output wire[2:0] s,c);
full_adder f0(.a(a[0]),.b(b[0]),.cin(cin),.s(s[0]),.c(c[0]));
full_adder f1(.a(a[1]),.b(b[1]),.cin(c[0]),.s(s[1]),.c(c[1]));
full_adder f2(.a(a[2]),.b(b[2]),.cin(c[1]),.s(s[2]),.c(c[2]));
endmodule



module onectr(input wire[7:0] in, output wire[2:0] c,s);
wire c0[3:0];
wire s0[3:0];
wire cin = 1'b0;

full_adder f0(in[0],in[1],cin,s0[0],c0[0]);
full_adder f1(in[2],in[3],cin,s0[1],c0[1]);
full_adder f2(in[4],in[5],cin,s0[2],c0[2]);
full_adder f3(in[6],in[7],cin,s0[3],c0[3]);

wire c1[1:0];
wire s1[1:0];
wire c2[1:0];
wire s2[1:0];

//b2_pa p0(.a[1](c0[0]),.a[0](s0[0]),.b[1](c0[1]),.b[0](s0[1]),.cin(cin),.s(s1),.c(c1));
//b2_pa p1(.a[1](c0[2]),.a[0](s0[2]),.b[1](c0[3]),.b[0](s0[3]),.cin(cin),.s(s2),.c(c2));

wire [1:0]a0 = {c0[0],s0[0]};
//a0[0] = s0[0];
//a0[1] = c0[0];
wire [1:0]b0 = {c0[1],s0[1]};
//b0[0] = s0[1];
//b0[1] = c0[1];
b2_pa p0({c0[0],s0[0]},{c0[1],s0[1]},cin,{s1[1],s1[0]},{c1[1],c1[0]});

//a0[0] = s0[2];
//a0[1] = c0[2];
//b0[0] = s0[3];
//b0[1] = c0[3];



wire [1:0]a2 = {c0[2],s0[2]};
wire [1:0]b2 = {c0[3],s0[3]};
b2_pa p1({c0[2],s0[2]},{c0[3],s0[3]},cin,{s2[1],s2[0]},{c2[1],c2[0]});

wire [2:0]a1 = {c1[1],s1[1],s1[0]};
wire [2:0]b1 = {c2[1],s2[1],s2[0]};
//a1[0] = s1[0];
//a1[1] = s1[1];
//a1[2] = c1[1];
//b1[0] = s2[0];
//b1[1] = s2[1];
//b1[2] = c2[1];

b3_pa p3({c1[1],s1[1],s1[0]},{c2[1],s2[1],s2[0]},cin,{s[2],s[1],s[0]},{c[2],c[1],c[0]});

endmodule