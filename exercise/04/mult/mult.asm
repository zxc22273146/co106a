// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// R0=3
//  @3   // 0
//	D=A  // 1
//	@R0  // 2
//	M=D  // 3
	
// R1=5
//	@5   // 4
//	D=A  // 5
//	@R1  // 6
//	M=D  // 7


	@R2           // R2 = 0
	M = 0  
	
	@R0           // a = R0
	D = M  
	@a     
	M = D  
(LOOP)

	@a            //   if (a <= 0) goto EXIT
	D = M  
	@EXIT  
	D; JLE        //   JLE = Jump Less Equal  JGE
	
	@a            //   a=a-1;
	M = M-1  

	@R1           // 	R2 = R2 + R1;
	D = M
	@R2   
	M = D+M 

	@LOOP         // 	goto LOOP
  0; JMP 
(EXIT)
  @EXIT  
	0; JMP