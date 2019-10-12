;Author: Hoanh Vo
;Author email: hvo123@csu.fullerton.edu
;Assigment 4
;Program name: Summation of Array

;Purpose: This program calculates the total of the array's elements; the array is received from control module.
;language: x86-64 assembly



;===== Begin code area ==============================================================================================================

extern printf
extern introduction

global summation

segment .data

	welcome db "Funtion summation in Sum module, written in Assembly, has begun execution. --- starting calculating the Sum.", 10,0
	
	stringformat db "%s",0

	
segment .bss  ; Reserved for uninitialized arrays
	;Empty
segment .text

summation:

;===== Backup all the GPRs ========================================================================================================
push rbp                                                    ;Backup the base pointer
mov  rbp,rsp                                                ;Advance the base pointer to start of the current 
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11: printf often changes r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags
;Registers rax, rip, and rsp are usually not backed up.


;=====  Array's address and size was passed from Control module to  ====================================================================================================
	
	

	
		mov r12,rsi	;r12 hold the size of of the array
		mov r13,rdi     ;r13 hold the address of the array

;===== Output initial messages ====================================================================================================
	
	mov rax, 0
	mov rdi, welcome
	call printf

;===== Loop to get the sum of the all array's members ====================================================================================================
	
	mov r15,0	; r15 is the counter
;	mov r14,0	; r14 is the sum, set r14 == 0			why not 0?????????????????/
	mov r11,0
	
loop:
	cmp r15,r12
	jge next				;exit the loop when counter >= array's
;	add r14,[r13+ (8*r15)]		;[rdi+8*r15] == [rdi +8*0]
	add r11,[r13 +(8*r15)]
	inc r15				; increase r15 by 1
	jmp loop			;repeat the loop 

next:

;=====  Return the sum back to the caller ====================================================================================================
	

	
	mov rax, r11



;===== Restore original values to integer registers ===============================================================================
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


