`timescale 1ns / 1ps

module MUX4X1(

//1. port list
	out         ,
	i0          ,
	i1          ,
	i2          ,
	i3          ,
	s1          ,
	s0
);

//2. port declaration
 
	output out  ;
	input i0    ;
	input i1    ;
	input i2    ;
	input i3    ;
 	input s1    ;
	input s0    ;

//data flow modeling
//assign out = (i0 & ~s1 & ~s0)
//	   | (i1 & ~s1 & s0 )
//	   | (i2 &  s1 & ~s0)
//	   | (i3 &  s1 & s0 );

// 3. tenary operator
assign out = s1 ? (s0 ? i3 : i2) : (s0 ? i1 : i0);


endmodule
