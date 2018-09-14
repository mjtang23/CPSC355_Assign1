/* Marcus Tang 10086730 */

define(y_r, l0)
define(x_r1, l1)
define(f_r3, l3)
define(f_r4, l4)
define(min_r5, l5)
define(minx_r6, l6)
define(op_r, o0)
define(op_r1, o1)
define(op_r2, o2)

fmt:    .asciz "The current minimum contains y value %d and x value %d\n"
        .align 4

 .global main
main:
      save   %sp, -96, %sp
      mov    -2, %x_r1    ! The starting point of the range
      ba     test
      mov    1000, %min_r5 ! Where the minimums will be stored and compared to new values



 .global loop
loop:
      mov    %x_r1, %op_r  ! Copying -2 into the operation register
      call   .mul       ! Multiplying -2 by -2 for first part of exponent
      mov    %x_r1, %op_r1   ! Copying the first exponent of the cube operation
      call   .mul       ! Multiplying the last part of the cube operation
      mov   %x_r1, %op_r1   ! Moving the last part of the cube operation
      call   .mul
      mov    2, %o1     ! Multiplying whatever is being cubed by 2
      mov    %op_r , %y_r   ! 2x^3 being stored in a local variable


      mov    %x_r1, %op_r   ! Start of 18x^2 part of function
      call   .mul       ! The exponent
      mov    %x_r1, %op_r1   ! Copy the x to make the exponent
      call   .mul
      mov    18, %op_r1    ! x^2 is being multiplied by 18
      mov    %op_r, %f_r3   ! results stored in %l3
      sub    %y_r, %f_r3, %l0 ! Subtracting 18x^2 from 2x^3

      mov    %x_r1, %op_r   ! The start of 10x
      call   .mul
      mov    10, %op_r1
      mov    %op_r , %f_r4

      add    %y_r, %f_r4, %y_r ! Adding the 10x to the rest of function
      add    %y_r, 39, %y_r  ! Adding the constant 39 to the function


      set     fmt, %op_r   ! Print Statement
      mov     %min_r5, %op_r1


      cmp     %y_r, %min_r5
      ble     next
      mov     %x_r1, %op_r2

back:
     set     fmt, %op_r   ! Print Statement
     mov     %min_r5, %op_r1  ! Placing the y value for minimum in print statement
     call    printf  ! Prints off statement
     mov     %l6, %op_r2 ! Placing the x value for minimum in print statement
     ba      test
     inc     %x_r1  ! increase the increment of the count by 1




next:
clr     %min_r5   ! Clears data from the l5 register
clr     %minx_r6  ! Clears data from the l6 register
mov     %y_r, %min_r5 ! Stores new y value to the l5 register
ba      back ! Points to back label
mov     %x_r1, %minx_r6 ! Stores new x value to the l6 registersh

test:
     cmp    %x_r1, 11     ! Loop guard
     ble    loop   ! Compares x increment to the limit of the loop
     nop


      mov     1, %g1    ! Ending the program
      ta      0
