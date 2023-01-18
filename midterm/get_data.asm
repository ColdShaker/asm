; author: David Fazio
; email: davidfazio1102@csu.fullerton.edu
; date: october 13, 2022
; sec: Section 7

extern printf
extern scanf
extern atol
extern isinteger

global fill

segment .data

string_format db "%s", 0

segment .bss  

segment .text 

fill:

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

;push qword 0
mov r15, rdi
mov r13, 0
beginLoop:
  

  mov rax, 0
  mov rdi, string_format ;"%s"
  mov rsi, rsp
  call scanf
  cdqe      ;if user hits crtl-d will fill whole register(rax) with -1 not just half the register.
  cmp rax, -1  
  je outOfLoop
  ;check for valid inputs
  mov rax, 0
  mov rdi, rsp
  call isinteger  ;returns a 0 or 1
  cmp rax, 0
  je invalid_input

  ;convert string to integer
  mov rax, 0                                                                                                            ;|
  mov rdi,rsp                                                                                                           ;|
  call atol                                                                                                             ;|
  mov r12, rax            ;Save a copy of the newly created integer in r12   
  
  mov [r15 + 8*r13], r12  ;at array[counter], place the input number
  inc r13  ;increment size
  jmp beginLoop

invalid_input:
  jmp beginLoop

outOfLoop:
    ;pop rax ; counter push at the beginning
    mov rax, r13  ; store the size of array



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

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**