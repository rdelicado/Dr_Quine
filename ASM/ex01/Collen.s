; Quine in assembly

section .data
    code db "; Quine in assembly%1$c%1$csection .data%1$c    code db %2$c%3$s%2$c%1$c%1$csection .text%1$c    global _start%1$c    extern printf%1$c    extern fflush%1$c%1$c_start:%1$c    call argv%1$c    call printf%1$c%1$c    ; fflush(NULL) empty all buffers%1$c    mov edi, 0%1$c    call fflush%1$c%1$c    ; exit the program%1$c    mov rax, 60%1$c    xor rdi, rdi%1$c    syscall%1$c%1$cargv:%1$c    lea rdi, [code]%1$c    mov esi, 10%1$c    mov edx, 34%1$c    lea rcx, [code]%1$c    mov eax, 0%1$c    ret"

section .text
    global _start
    extern printf
    extern fflush

_start:
    call argv
    call printf

    ; fflush(NULL) empty all buffers
    mov edi, 0
    call fflush

    ; exit the program
    mov rax, 60
    xor rdi, rdi
    syscall

argv:
    lea rdi, [code]
    mov esi, 10
    mov edx, 34
    lea rcx, [code]
    mov eax, 0
    ret