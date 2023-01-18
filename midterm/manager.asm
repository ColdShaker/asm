; author: David Fazio
; email: davidfazio1102@csu.fullerton.edu
; date: october 13, 2022
; sec: Section 7

extern printf
extern scanf
extern fgets
extern stdin
extern strlen
extern Display
extern reverse
extern fill

global manager

segment .data

input_name db "Please enter your name: ", 0
prompt db 10, "Please enter integers separated by ws and press <enter><control+d> to terminate inputs. ", 10, 0
output_prompt db 10, "You entered: ", 10, 0
output_size db 10, "The array has %d long integers", 10, 0
reverse_output db 10, "The function reverse was called", 10, 0
display_array2 db 10, "The seccond array holds these values:", 10, 0

segment .bss
the_array resq 10
array2 resq 10


segment .text

manager:
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


push qword 0

;=====Prompt Name=====
push qword 0
mov rax, 0
mov rdi, prompt 
call printf
pop rax

;====fill the array===
push qword 0
mov rax,0
mov rdi, the_array
call fill
mov r13, rax     ;r13 holds the number of values stored in the array
pop rax

;======output prompt=====
push qword 0
mov rax, 0
mov rdi, output_prompt
call printf
pop rax

;====display array1===
push qword 0
mov rax, 0
mov rdi, the_array
mov rsi, r13
call Display
pop rax


;=======output size of array========
push qword 0
mov rax, 0
mov rdi, output_size
mov rsi, r13
call printf
pop rax

;=====Prompt Name=====
push qword 0
mov rax, 0
mov rdi, reverse_output 
call printf
pop rax

;=====Prompt Name=====
push qword 0
mov rax, 0
mov rdi, display_array2 
call printf
pop rax

;====fill the array2===
mov rax, 0
mov rdi, array2
mov rsi, the_array
mov rdx, r13
call reverse


;====display array2===
push qword 0
mov rax, 0
mov rdi, array2
mov rsi, r13
call Display
pop rax

pop rax
mov rax, array2
;===== Restore original values to integer registers ===================================================================
popf                                                     
pop rbx                                            
pop r15                                                 
pop r14                                             
pop r13                                               
pop r12                                                    
pop r11                                                     
pop r10                                                    
pop r9                                                 
pop r8                                            
pop rcx                                                   
pop rdx                                                    
pop rsi                                                     
pop rdi                                                    
pop rbp    

ret