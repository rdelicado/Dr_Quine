; Grace in assembly (x86_64 Linux version)

%define CODE "; Grace in assembly (x86_64 Linux version)%1$c%1$c%%define CODE %2$s%1$c%%define FILE"
%define FILE "Grace_kid.s"
%define O_FLAGS 0x241  ; O_WRONLY|O_CREAT|O_TRUNC

section .data
filename db FILE, 0
code db CODE
code_len equ $ - code

section .text
global _start
_start:
    mov rax, 2
    mov rdi, filename
    mov rsi, O_FLAGS
    mov rdx, 0o644
    syscall

    cmp rax, 0
    jl exit

    mov r8, rax

    mov rax, 1
    mov rdi, r8
    mov rsi, code
    mov rdx, code_len
    syscall

    mov rax, 3
    mov rdi, r8
    syscall

exit:
    mov rax, 60
    xor rdi, rdi
    syscall