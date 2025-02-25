.extern printf
.extern scanf
.section .rodata
num1: .string "Please enter the first number: "
num2: .string "\nPlease enter the second number: "
op: .string "\nPlease enter the arithmetic operation: "
num_fmt: .string "%d"
char_fmt: .string "%c"

.section .text
.globl main
.type	main, @function 
main:
    # Enter
    pushq   %rbp
    movq    %rsp, %rbp  

    #print the first number string
    leaq    num1(%rip), %rdi
    xorq    %rax, %rax
    call    printf

    #get the first number from the user
    leaq    num_fmt(%rip), %rdi
    movq    %rsp, %rsi
    xorq    %rax, %rax
    call    scanf

    #pushing the first number to the stack
    pushq   %rsi


exit:
    movq    %rbp, %rsp
    popq    %rbp
    ret
