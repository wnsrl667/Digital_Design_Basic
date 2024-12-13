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

//wire signal

	wire s1n, s0n;
	wire y0, y1, y2, y3;

//s1n, 20n

not (s1n, s1)            ;
not (s0n, s0)            ;

//first level modeling(3 input AND)

and ( y0, i0, s1n, s0n)  ;
and ( y1, i1, s1n, s0)   ;
and ( y2, i2, s1, s0n)   ;
and ( y3, i3, s1, s0)    ;


//second level modeling(4 input OR)

or ( out, y0, y1, y2, y3);





endmodule
