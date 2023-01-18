;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Michael Ball
;  Author email: MikeBall@csu.fullerton.edu
;  Date: December 13 2022
;  Section 7
;========================================================================================================
;===== Begin code section ==============================================================================================
global manager

extern printf                ; void printf(const char *format, ...)
extern scanf                 ; int scanf(const char *format, ...)
extern fill_array
extern atof
extern display

segment .data
program_description db "This program will measure the execution time of a sort function",10,0 ;0 is null termination for strings, 10 is a new line
input_msg db "Please input the count of number of data items to be placed into the array with maximum 10 million):",10,0
fill_finish_msg db "The array has been filled with non-deterministic random 64-bit float numbers.",10,0
test_msg db "Your number is %d", 10, 0
int_format db "%d", 0


;display_first_nums db "Here are 10 numbers of the array at the beginning"10,0

segment .bss
myArray resq 1
arraySize resq 10000000

segment .text

manager:


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

;program description 
mov rax,0
mov rdi, program_description
call printf

;input message
mov rax,0
mov rdi,input_msg
call printf


;take in 1 string
mov rax,0
sub rsp , 1024 ;creates room on stack for a float
mov rdi, int_format ;%d
mov rsi, arraySize
call scanf
mov r15, [arraySize]

mov rax,0
mov rdi,test_msg
mov rsi, r15
call printf

;void fill_array(double myArray[], long size)
mov rax,0
mov rdi, myArray
mov rsi, r15
call fill_array

mov rax,0
mov rdi,test_msg
mov rsi, r15
call printf

mov  rax, 0
mov  rdi, [myArray]
mov  rsi, 0
mov  rdx, 10
call display




add rsp,1024

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