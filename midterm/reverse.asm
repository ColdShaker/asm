; author: David Fazio
; email: davidfazio1102@csu.fullerton.edu
; date: october 13, 2022
; sec: Section 7

global reverse

segment .data

segment .bss  

segment .text 

reverse:

push rbp
mov  rbp,rsp
push rdi                                                   
push rsi                                                    
push rdx                                                  
push rcx                                                    
push r8                                                    
push r9                                                     
push r10                                                   
push r11                                                 
push r12                                                  
push r13                                                   
push r14                                                    
push r15                                                   
push rbx                                                    
pushf                                                       

push qword 0 
; Taking information from parameters
mov r15, rdi  ; This holds the first parameter (the array2)
mov r14, rsi  ; This holds the first parameter (the_array)
mov r13, rdx  ; number of elements

mov r12, 0     ;loop counter
mov r11, r13    ;copy of array size
dec r11
beginLoop:
cmp r12, r13 ; we want to exit loop when we hit the size of array
je outOfLoop

mov r8, [r14 + 8*r11]
mov [r15 + 8*r12], r8 
inc r12  ;increment size
dec r11  
jmp beginLoop

outOfLoop:

pop rax

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
