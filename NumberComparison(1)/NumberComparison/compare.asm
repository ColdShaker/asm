;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Name: Michael Ball 
;Email: MikeBall@csu.fullerton.edu
;Name of Program: Floating_Point_Comparison
;Date of Completion: 9/4/2022
;Language: x86-64 Assembly
;This program is designed to take in two floating point numbers, show the larger number to the 
;user, and return the smaller one to the driver
;This is the main module of the program. This is where inputs are prompted, validated, compared, and returned to the driver, which is written in C++
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

extern printf
extern scanf
extern isFloat
extern atof

global compare

;Section that includes all of the data later used in the assembly file
segment .data
input_prompt db "Please enter two float numbers separated by white space. Press enter after the second input.", 10, 0
two_string_format db "%s %s", 0
bad_message db "bad float. run again.", 10, 0
two_float_format db "Your numbers are %.16lf and %.16lf", 10, 0
larger_number db "The larger of the two numbers is %.16lf", 10, 0
segment .bss

segment .text

compare:
;Prolog ===== Insurance for any caller of this assembly module ========================================================
;Any future program calling this module that the data in the caller's GPRs will not be modified.
push rbp
mov  rbp,rsp
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf
                                                       ;Backup rflags                                         
; print input prompt
mov rax, 0
mov rdi, input_prompt
call printf

;take in 2 strings
sub rsp, 2048 ; make space for 1 string
mov rax, 0
mov rdi, two_string_format
mov rsi, rsp

mov rdx, rsp
add rdx, 1024
mov r15, rsp
mov r14, rdx
call scanf

;check if first string is bad input
mov rax, 0
mov rdi, r15
call isFloat
cmp rax, 0
je BadMessage

; validate second float
mov rax, 0
mov rdi, r14
call isFloat
cmp rax, 0
je BadMessage

;is a float, convert to float (first float)
mov rax, 0
mov rdi, r14
call atof
movsd xmm14, xmm0

;is a float, convert to float (second float)
mov rax, 0
mov rdi, r15
call atof
movsd xmm15, xmm0


; print out the 2 nums
mov rax, 2
mov rdi, two_float_format
movsd xmm0, xmm15
movsd xmm1, xmm14
call printf

;NEXT: find largest number and save it to register
ucomisd xmm15,xmm14
ja xmm15large
movsd xmm9,xmm14
movsd xmm10,xmm15
jmp continue
xmm15large:
movsd xmm9,xmm15
movsd xmm10,xmm14
continue:

;output to console which one is largest
mov rax,1
mov rdi,larger_number
movsd xmm0,xmm9
call printf
;return to call
jmp end

;Message for when program encounters incorrect float
BadMessage:
mov rax, 0
mov rdi, bad_message
call printf
;print "bad"
end:
add rsp, 2048
;Prepare smaller number for driver return
movsd xmm0,xmm10
;===== Restore original values to integer registers ===================================================================
popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp                                                     ;Restore rbp

ret