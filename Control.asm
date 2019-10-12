;Author: Hoanh Vo
;Author email: hvo123@csu.fullerton.edu
;Assigment 4
;Program name: Summation of Array

;Purpose: This program is control module
;language: x86-64 assembly



;===== Begin code area ==============================================================================================================

extern printf
extern getchar
extern clearerr
extern stdin			;extern the std input

extern getInput		; function in Fill module
extern show_array	; function in Display module
extern summation	; function in Sum module

global introduction

segment .data

	welcome db " The  X86-64 -control module - has begun executing.", 10,0
	c_ex_message  db "Are you ready (press 'c' for continue, 'x' for exit)?",0
	
	stringformat db "%s",0
	nextLine db " ",10,0
	
	y_or_no_question  db  "Are these values correct (y or n)?",0
	output_sum_message  db  "The control module has recieved the sum = %ld (in decimal) from the calculation.",10,0
segment .bss  ; Reserved for uninitialized arrays
	aArray  resq 100		;reserve an quard array of 100 elements 
				
segment .text

introduction:

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

;===== Output initial messages ====================================================================================================

	mov rax, 0
	mov rdi, welcome
	call printf



	
;==============================================================================================================

;repeat_loop:
	
	
	

;Next, ask user if they are ready or not 
	mov rax,0 	;no data will be printed
	mov rdi, stringformat		; "%s"
	mov rsi, c_ex_message			; countinue or exist question?
	call printf    ;call a library function to make the output

;==============================================================================================================
	mov rax,0
	mov rdi, [stdin]
	call clearerr		;clear the stdin

;==============================================================================================================




;Next, get single char input from user
	
	mov rax, 0
	call getchar
	mov r15,rax
	call getchar		;to get rid of the enter key

;Next,comparing with char x , if user put char x jump to the end of the program
	cmp r15, 120		; x == 120 in dec, 
	je end_Program



;----------------------------------------------------------------
;Next,comparing with char c , if user put char c continue
	cmp r15, 99		; c == 99 in dec, 
	je next

;Otherwise ask again the question if they are ready or not 
;	jmp repeat_loop
	

next:




;==============================================================================================================

another_loop:
;==============================================================================================================
	mov rax,0
	mov rdi, [stdin]
	call clearerr		;clear the stdin

;==============================================================================================================
;calling funtion getInput in Fill module to get input for the array
;this function will the return the size of the array back to control module 
	mov rax, 0
	mov rsi, 100		;2nd parameter: size of array
	mov rdi, aArray		;1st parameter: address of array
	call getInput

;=======save the real size of array to r12===================and  print next line===========================================================================
	mov r12,rax	; r12 will hold the realsize of the array

;NExt, print out the nextline
	mov rax, 0
	mov rdi, stringformat
	mov rsi, nextLine
	call printf
;==============================================================================================================
	
;calling funtion show_array in Dislay module to print out the array 
	mov rax, 0
	mov rsi, r12		;2nd parameter: size of array
	mov rdi, aArray		;1st parameter: address of array
	call show_array


;==============================================================================================================
;asking user if the array is correct

	
;----------------------------------------------------------------	
	mov rax,0 	;no data will be printed
	mov rdi, stringformat		; "%s"
	mov rsi, y_or_no_question			; "are these values correct (y or n)?"
	call printf    ;call a library function to make the output
	
;==============================================================================================================
	mov rax,0
	mov rdi, [stdin]
	call clearerr		;clear the stdin
	
;==============================================================================================================	
	;Next, get single char input from user
	
	mov rax, 0
	call getchar
	mov r14,rax		



	call getchar		;to get rid of the enter key

;Next,comparing with char y , if user put any char other than y jump the another_loop
;otherwise input == y continue
	
			; y == 121 in dec, n == 110
			
	
	
	cmp r14, 121
	jne another_loop
;==============================================================================================================
;==============================================================================================================
	mov rax,0
	mov rdi, [stdin]
	call clearerr		;clear the stdin
	
;=====================================================================================
;calling the sumation function in Sum module	
	
	
	mov rax, 0
	mov rsi, r12		;2nd parameter: size of array (
	mov rdi, aArray		;1st parameter: address of array
	call summation
	
	
	
	
;=================show the Sum to the screen=============================================================================================
	mov r13,rax	;make a coppy of the sum to the r13 before calling printf 
	
	mov rsi, rax
	mov rdi, output_sum_message
	call printf

;=================passing the sum back to the main() driver=============================================================================================

	mov rax, r13
	

end_Program:

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


