// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Pseudocode:
//
// times = if R1 < 0 then -R1 else R1
// i = 0
// accm = 0
//
// LOOP
//   if i >= times goto STOP
//   accm = accm + R0
//   i = i + 1
//   goto LOOP
//
// STOP
//   R2 = if R1 > 0 then accm else -accm
//
// END
//   goto END

// times = if R1 < 0 then -R1 else R1
@R1
D=M
@times
M=D
@STARTLOOP // Avoid flipping to positive if already positive.
D; JGE
@times
M=-D

(STARTLOOP)
  // i = 0
  @i
  M=0

  // accm = 0
  @accm // Our intermediate result.
  M=0

(LOOP)
  // if i >= times goto STOP
  @i
  D=M
  @times
  D=D-M
  @STOP
  D; JGE

  // accm = accm + R0
  @R0
  D=M
  @accm
  M=M+D

  // i = i + 1
  @i
  M=M+1

  // goto LOOP
  @LOOP
  0; JMP

(STOP)
  // R2 = if R1 > 0 then accm else -accm
  @accm
  D=M
  @R2
  M=D  
  @R1
  D=M
  @END
  D; JGE
  @R2
  M=-M

(END)
  // goto END
  @END
  0; JMP
