`timescale 1ns / 1ps
module tb_adder ();

reg clk, rst_n;
reg [15:0] in1, in2, in3, in4;
wire [15:0] sum;
wire fin;

adder DUT (
	.clk(clk),
	.rst_n(rst_n),
	.in1(in1),
	.in2(in2),
	.in3(in3),
	.in4(in4),
	.sum(sum),
	.fin(fin)
);



always #5 clk= ~clk;

initial begin

	clk = 0;
	rst_n = 0;
	in1 = 16'b0;
	in2 = 16'b0;
	in3 = 16'b0;
	in4 = 16'b0;

// t=0
#0;

// t=10
#10
rst_n = 1;

// t=40
#30
in1 = 16'd1111;
in2 = 16'd1111;
in3 = 16'd1111;
in4 = 16'd1111;

// t=50
#10
in1 = 16'd3333;
in2 = 16'd3333;
in3 = 16'd3333;
in4 = 16'd3333;

// t=60
#10
in1 = 16'd5555;
in2 = 16'd5555;
in3 = 16'd5555;
in4 = 16'd5555;

// t=200
#140 
rst_n = 0;

// t=300
#90
$finish;
end

endmodule
