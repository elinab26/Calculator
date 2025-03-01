.extern printf
.extern scanf
.section .rodata
num1: .string "Please enter the first number: "
num2: .string "Please enter the second number: "
op: .string "Please enter the arithmetic operation: "
result: .string "The result is: %d\n"
error_str: .string "You can't do that operation\n"
num_fmt: .string "%d"
char_fmt: .string " %c"


.section .text
.globl main
.type	main, @function 
main:
    # Enter
    pushq %rbp
    movq %rsp, %rbp  
    pushq %rbx
    
menu:
    subq $8, %rsp

    #print the num1 string
    leaq num1(%rip), %rdi
    xorq %rax, %rax
    call printf

    #get the first number and save it in the stack
    leaq num_fmt(%rip), %rdi
    leaq (%rsp), %rsi
    xorq %rax, %rax
    call scanf

    #print the num2 string
    leaq num2(%rip), %rdi
    xorq %rax, %rax
    call printf

    #get the second number and save it in the stack
    leaq num_fmt(%rip), %rdi
    leaq 8(%rsp), %rsi
    xorq %rax, %rax
    call scanf

    #print the op string
    leaq op(%rip), %rdi
    xorq %rax, %rax
    call printf 

    #get the operator and save it in the stack
    leaq char_fmt(%rip), %rdi
    leaq 16(%rsp), %rsi
    xorq %rax, %rax
    call scanf

    movq (%rsp), %rdi
    movq 8(%rsp), %rsi
    movq 16(%rsp), %rbx

    cmpb $'+', %bl
    je add

    cmpb $'-', %bl
    je sub

    cmpb $'*', %bl
    je mul

    cmpb $'/', %bl
    je div

add:
    movl %edi, %eax
    addl %esi, %eax
    jmp exit

sub:
    movl %edi, %eax
    subl %esi, %eax
    jmp exit

mul:
    movl %edi, %eax
    imul %esi, %eax
    jmp exit

div:
    cmpl $0, %esi
    je error
    xorq %rax, %rax
    movl %edi, %eax
    divl %esi
    jmp exit

error:
    addq $8, %rsp
    movq $error_str, %rdi
    xorq %rax, %rax
    call printf
    jmp menu


exit:
    movl %eax, %ebx
    leaq result(%rip), %rdi
    movl %eax, %esi
    xorq %rax, %rax
    call printf

    movq %rbx, %rax
    addq $8, %rsp
    popq %rbx

    movq %rbp, %rsp
    popq %rbp
    movq $60, %rax      
    movq $0, %rdi       # exit status
    syscall            
