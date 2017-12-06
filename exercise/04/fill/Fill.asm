// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// forever
//   arr = SCREEN
//   for (i=0; i<8192; i++) {
//     if (*KBD != 0)
//       arr[i] = -1
//     else
//       arr[i] = 0
//   }
//   goto forever;

(FOREVER)
// arr = SCREEN
	@SCREEN
	D=A
	@arr
	M=D

// n=8192
	@8192
	D=A
	@n
	M=D

	@i
	M=0
(LOOP)
  // if (i==n) goto ENDLOOP
	@i
	D=M
	@n
	D=D-M
	@ENDLOOP
	D; JEQ   // Jump Equal
	
  // if (*KBD != 0)
	@KBD
	D=M     // D = *KBD
	@ELSE
	D; JEQ  // if (*KBD==0) goto ELSE
	
	//   RAM[arr+i] = -1
	@arr
	D=M
	@i
	A=D+M
	M=-1
	
	@ENDIF
	0; JMP
(ELSE)	
  // else 
  //   RAM[arr+i] = 0
	@arr
	D=M
	@i
	A=D+M
	M=0
	
(ENDIF)
	
	// i++
	@i
	M=M+1
	
	@LOOP
	0; JMP

(ENDLOOP)
	@FOREVER
	0; JMP