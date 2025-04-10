#Write your image processing code here in assembly
.global student_sepia
student_sepia:
        PUSH {LR}                       @This is how you function
        PUSH {R4-R12}           @Remember?

        @Write your code here
  @void sepia(unsigned char *in,unsigned char *out, int width, int height)
  MULS R7, R2, R3
  BLE quit
  ADD R7, R7, R7, LSL #1
  ADD R3, R0, R7
  MOV R7, #40

  loop:
  VLDMIA R0!,{d0-d2}
  CMP R0, R3
  VADD.U8 d0,d0,d0
  VADD.U8 d1,d1,d1
  VADD.U8 d2,d2,d2
  VADD.U8 d0,d0,d1 
  VADD.U8 d0,d0,d2
  VSHR.U8 d0,d2,#1
  VMOV.U8 d1,d0
  VMOV.U8 d2,d0
  VSTMIA R1!,{d0-d2}
  BLE loop


quit:
        POP {R4-R12}         @Restore R4 through R12 for the calling function
        POP {PC}             @Return from a function

