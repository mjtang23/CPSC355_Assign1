/* Marcus Tang 10086730 */

fmt:    .asciz "The current minimum contains y value %d and x value %d\n"
        .align 4

 .global main
main:
      save   %sp, -96, %sp
      mov    -2, %l1    ! The starting point of the range
      mov    1000, %l5 ! Where the minimums will be stored and compared to new values
      ba     test
      nop



 .global loop
loop:
      mov    %l1, %o0   ! Copying -2 into the operation register
      mov    %l1, %o1   ! Copying the first exponent of the cube operation
      call   .mul       ! Multiplying -2 by -2 for first part of exponent
      nop
      mov    %l1, %o1   ! Moving the last part of the cube operation
      call   .mul       ! Multiplying the last part of the cube operation
      nop
      mov    2, %o1     ! Multiplying whatever is being cubed by 2
      call   .mul
      nop
      mov    %o0, %l0   ! 2x^3 being stored in a local variable


      mov    %l1, %o0   ! Start of 18x^2 part of function
      mov    %l1, %o1   ! Copy the x to make the exponent
      call   .mul       ! The exponent
      nop
      mov    18, %o1    ! x^2 is being multiplied by 18
      call   .mul
      nop
      mov    %o0, %l3   ! results stored in %l3
      sub    %l0, %l3, %l0 ! Subtracting 18x^2 from 2x^3

      mov    %l1, %o0  ! The start of 10x
      mov    10, %o1
      call   .mul
      nop
      mov    %o0, %l4

      add    %l0, %l4, %l0 ! Adding the 10x to the rest of function
      add    %l0, 39, %l0  ! Adding the constant 39 to the function


      set     fmt, %o0  ! Print Statement
      mov     %l5, %o1
      mov     %l1, %o2

      cmp     %l0, %l5
      ble     next
      nop

back:
     set     fmt, %o0  ! Print Statement
     mov     %l5, %o1
     mov     %l6, %o2
     call    printf
     nop
     inc     %l1  ! increase the increment of the count by 1
     ba      test
     nop




next:
clr     %l5
clr     %l6
mov     %l0, %l5
mov     %l1, %l6
ba      back
nop

test:
     cmp    %l1, 11     ! Loop guard
     ble    loop
     nop


      mov     1, %g1    ! Ending the program
      ta      0
