// Program: Mult.asm
// Computes:  product R0 * R1 and stores the result in R2 (RAM[2]).

//	n1 = R[0]
//	n2 = R[1]
//	product = 0
// LOOP:
// 	if n2  ==  0 goto STOP
// 	product = product + n1
// 	n2  = n2 - 1
// 	goto LOOP
//STOP:
// 	R[2]  = product



@R0				// init. ram[0] value into n1
D=M
@n1
M=D

@R1				// init. ram[1] value into n2
D=M
@n2
M=D

@product		//init. product as 0
M=0

(LOOP)
@n2
D=M
@STOP
D;JEQ			//  if  number2 = 0 then goto STOP
@n2
M=M-1

@n1
D=M
@product
M=D+M			// product  = product  + n1

@LOOP
0;JMP

(STOP)
@product
D=M
@R2
M=D				// save product value into ram[2]

(END)
@END
0;JMP

