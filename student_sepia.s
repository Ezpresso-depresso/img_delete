#Write your image processing code here in assembly
.global student_sepia
student_sepia:
	PUSH {LR} 			@This is how you function
	PUSH {R4-R12}		@Remember?

MULS R4, R2, R3
BLE quit 
ADD R4, R4, R4, LSL #1 
ADD R3, R0, R4 



loop:
VLDMIA R0!, {d0-d3} //Load 256 bits into q0 and q1
CMP R0,R3 //See if we re done. R3 is pointer to end of the array
VSHR.U8 q0,q0,#1 //First 128 bits shift right one bit, in 8 bit channels
VSHR.U8 q1, q1,#1 //Second 128 bits shift right one bit
VSTMIA R1!, {d0-d3} //Store 256 bits into *out
BLE loop
quit:
	POP {R4-R12}         @Restore R4 through R12 for the calling function
	POP {PC}             @Return from a function

