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

(MAIN)
  // if key pressed, then shade is black, else is white
  @shade
  M=-1
  @KBD
  D=M
  @STARTLOOP
  D; JGT
  @shade
  M=0

(STARTLOOP)
  // i = 0
  @i
  M=0

(LOOP)
  // if i >= 8191 goto MAIN
  @i
  D=M
  @8191 
  D=D-A
  @MAIN
  D; JGE
 
  // SCREEN[i] = shade
  // (There are only two registers, D and A/M, so we need to stash
  //  the computed address to write to before using two registers to
  //  read the preset shade value and then once that's safely stored in
  //  D, bring back the precomputed address to read into A/M for write.) 
  @i
  D=M
  @SCREEN
  D=D+A
  @nextblock
  M=D
  @shade
  D=M
  @nextblock
  A=M 
  M=D

  // i = i + 1 
  @i
  M=M+1  

  // goto LOOP
  @LOOP
  0; JMP
