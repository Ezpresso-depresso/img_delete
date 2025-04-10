#Write your image processing code here in assembly
.global student_sepia
student_sepia:
        PUSH {LR}                       @This is how you function
        PUSH {R4-R12}           @Remember?

        @Write your code here
  @void sepia(unsigned char *in,unsigned char *out, int width, int height)
  MULS R7, R2, R3 //Total bytes of image
  BLE quit
  ADD R7, R7, R7, LSL #1
  ADD R3, R0, R7

  loop:
  VLDMIA R0!,{d0-d3}
  CMP R0,R3
  VMOV q2, q0
  VADD.U8 q0,q0,q2
  VADD.U8 q1,q1,q2
  VSTMIA R1!, {d0-d3}
  BLE loop

quit:
        POP {R4-R12}         @Restore R4 through R12 for the calling function
        POP {PC}             @Return from a function

