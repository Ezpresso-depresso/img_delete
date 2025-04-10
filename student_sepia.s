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
  VLDMIA R0!,{d0}
  CMP R0, R3
  VMUL.U8 d0,d0
  VSTMIA R1!,{d0}
  BLE loop


quit:
        POP {R4-R12}         @Restore R4 through R12 for the calling function
        POP {PC}             @Return from a function

