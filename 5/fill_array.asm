global fill_array

extern printf
extern scanf

segment .data
float_format db "%lf",0

segment .bss

segment .text 

fill_array:

push       rbp                          ;Save a copy of the stack base pointer
mov        rbp, rsp                     ;We do this in order to be fully compatible with C and C++.
push       rbx                          ;Back up rbx
push       rcx                          ;Back up rcx
push       rdx                          ;Back up rdx
push       rsi                          ;Back up rsi
push       rdi                          ;Back up rdi
push       r8                           ;Back up r8
push       r9                           ;Back up r9
push       r10                          ;Back up r10
push       r11                          ;Back up r11
push       r12                          ;Back up r12
push       r13                          ;Back up r13
push       r14                          ;Back up r14
push       r15                          ;Back up r15
pushf                                   ;Back up rflags

mov r15, rdi ;the array
mov r14, rsi ;the array size




; this for loop will continue until the entered array size is reached
mov r13, 0 ; for loop counter
beginLoop:
  cmp r14, r13 ; we want to exit loop when we hit the size of array
  je outOfLoop

  ;Generate random number using rdrand.
  mov rax, 0
  rdrand rax    

  ;convert to float, move to xmm0, then add to array
  movq xmm0, rax
  movsd [r15 + (r13 * 8)], xmm0

  inc r13  ;increment loop counter
  jmp beginLoop
outOfLoop:

popf                                            ;Restore rflags
pop        r15                                  ;Restore r15
pop        r14                                  ;Restore r14
pop        r13                                  ;Restore r13
pop        r12                                  ;Restore r12
pop        r11                                  ;Restore r11
pop        r10                                  ;Restore r10
pop        r9                                   ;Restore r9
pop        r8                                   ;Restore r8
pop        rdi                                  ;Restore rdi
pop        rsi                                  ;Restore rsi
pop        rdx                                  ;Restore rdx
pop        rcx                                  ;Restore rcx
pop        rbx                                  ;Restore rbx
pop        rbp                                  ;Restore rbp
;Notice that rax is not restored because it holds the value to be returned to the caller.

ret;                                            ;ret will pop the system stack into rip.  The value obtained is an 
;                                               ;address where the next instruction to be executed is stored.
;===== End of subprogram strlen ========================================================================================
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2