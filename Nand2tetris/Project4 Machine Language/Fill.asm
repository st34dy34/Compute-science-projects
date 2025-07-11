// Program: Fill.asm
// Task: Runs an infinite loop that listens to the keyboard.
// 		If key is pressed, the program blackens the entire screen.
// 		Else clears the screen.

// 1. Variable initialization

@SCREEN
D=A						// Reg A holds addr of SCREEN (16384)
@screen_addr 
M=D

@KBD
D=A						// Reg A holds addr of KEYBOARD (24576)
@keyboard_addr 
M=D

@8192 					 // Number of pixels in monitor = 8192
D=A
@counter
M=D           			

// 2. Main loop - continuously check keyboard status
(MAIN_LOOP)
	@counter
	D=M
	@RESET
	D;JEQ 			//reset counter, keyboard_addr if counter == 0

	@keyboard_addr		
	A=M
	D=M				

	@MAKE_BLACK
	D;JNE

	@CLEAR
	0;JMP


// 3. Blacken screen loop - set each pixel to -1 (all bits 1)
(MAKE_BLACK)
	@counter
	D=M
	@MAIN_LOOP
	D;JEQ					// if D==0 jump to mainloop
	
	@screen_addr 
	A=M
	M=-1					// Sets the current bit to black 
	
	@screen_addr 
	M=M+1
	
	@counter
	M=M-1

	@MAKE_BLACK
	0;JMP



// 4. Clear screen loop - set each pixel to 0 (all bits 0)
(CLEAR)
	@counter
	D=M
	@MAIN_LOOP
    D;JEQ 

	@screen_addr 
	A=M
	M=0					// Sets the current bit to black 
	
	@screen_addr 
	M=M+1
	
	@counter
	M=M-1
	
	@CLEAR
    0;JMP					

// 5. Reset variables to start a new screen fill
(RESET)
	@8192
	D=A
	@counter
	M=D

	@SCREEN
	D=A
	@screen_addr
	M=D

	@MAIN_LOOP
	0;JMP

