.extern printf
.extern scanf
.section .rodata
num1: .string "Please enter the first number: "
num2: .string "Please enter the second number: "
op: .string "Please enter the arithmetic operation: "
num_fmt: .string "%d"
char_fmt: .string " %c"


.section .text
.globl main
.type	main, @function 
main:
    # Enter
    pushq %rbp
    movq %rsp, %rbp  

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


exit:
    movq %rbp, %rsp
    popq %rbp
    movq $60, %rax      
    movq $0, %rdi       # exit status
    syscall            
