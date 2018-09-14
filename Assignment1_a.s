/* Marcus Tang 10086730 */











/* Marcus Tang 10086730 */

fmt:    .asciz "The current minimum contains y value %d and x value %d\n"
        .align 4

 .global main
main:
      save   %sp, -96, %sp
      mov    -2, %l1    ! The starting point of the range
      ba     test
      mov    1000, %l5 ! Where the minimums will be stored and compared to new values



 .global loop
loop:
      mov    %l1, %o0  ! Copying -2 into the operation register
      call   .mul       ! Multiplying -2 by -2 for first part of exponent
      mov    %l1, %o1   ! Copying the first exponent of the cube operation
      call   .mul       ! Multiplying the last part of the cube operation
      mov   %l1, %o1   ! Moving the last part of the cube operation
      call   .mul
      mov    2, %o1     ! Multiplying whatever is being cubed by 2
      mov    %o0 , %l0   ! 2x^3 being stored in a local variable


      mov    %l1, %o0   ! Start of 18x^2 part of function
      call   .mul       ! The exponent
      mov    %l1, %o1   ! Copy the x to make the exponent
      call   .mul
      mov    18, %o1    ! x^2 is being multiplied by 18
      mov    %o0, %l3   ! results stored in %l3
      sub    %l0, %l3, %l0 ! Subtracting 18x^2 from 2x^3

      mov    %l1, %o0   ! The start of 10x
      call   .mul
      mov    10, %o1
      mov    %o0 , %l4

      add    %l0, %l4, %l0 ! Adding the 10x to the rest of function
      add    %l0, 39, %l0  ! Adding the constant 39 to the function


      set     fmt, %o0   ! Print Statement
      mov     %l5, %o1


      cmp     %l0, %l5
      ble     next
      mov     %l1, %o2

back:
     set     fmt, %o0   ! Print Statement
     mov     %l5, %o1  ! Placing the y value for minimum in print statement
     call    printf  ! Prints off statement
     mov     %l6, %o2 ! Placing the x value for minimum in print statement
     ba      test
     inc     %l1  ! increase the increment of the count by 1




next:
clr     %l5   ! Clears data from the l5 register
clr     %l6  ! Clears data from the l6 register
mov     %l0, %l5 ! Stores new y value to the l5 register
ba      back ! Points to back label
mov     %l1, %l6 ! Stores new x value to the l6 registersh

test:
     cmp    %l1, 11     ! Loop guard
     ble    loop   ! Compares x increment to the limit of the loop
     nop


      mov     1, %g1    ! Ending the program
      ta      0
