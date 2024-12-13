`timescale 1ns / 1ps

module adder (
	clk,
	rst_n,
	in1,
	in2,
	in3,
	in4,
	sum,
	fin
);

	input clk;
	input rst_n;
	input [15:0] in1;
	input [15:0] in2;
	input [15:0] in3;
	input [15:0] in4;
	output reg [15:0] sum;
	output reg fin;


	reg [15:0] in1_reg, in2_reg, in3_reg, in4_reg;
	reg [15:0] temp_add1, temp_add2;
	reg [1:0] state, next_state;

	localparam IDLE = 2'b00, ADD1=2'b01, ADD2=2'b10, DONE=2'b11;

always @(posedge clk or negedge rst_n) 
begin
	if (~rst_n) begin 
	state <= IDLE;
	in1_reg <= 16'b0;
	in2_reg <= 16'b0;
	in3_reg <= 16'b0;
	in4_reg <= 16'b0;
	temp_add1 <= 16'b0;
	temp_add2 <= 16'b0;
	sum <= 16'b0;
	fin <= 0;
end 
else begin
	state <= next_state;
	in1_reg <= in1;
	in2_reg <= in2;
	in3_reg <= in3;
	in4_reg <= in4;
	end
end

always @(*) begin 
	case(state)
	IDLE: begin
	next_state = ADD1;
	fin = 0;
end
	ADD1: begin
	temp_add1=in1_reg+in2_reg;
	next_state = ADD2;
	fin=0;
end
	ADD2: begin
	temp_add2=in3_reg+in4_reg;
	next_state = DONE;
	fin=0;
end
	DONE: begin
	sum= temp_add1+temp_add2;
	next_state=IDLE;
	fin=1;
end

	default: next_state = IDLE;
endcase
end






endmodule





	
