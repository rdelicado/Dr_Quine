; Grace in assembly (x86_64 Linux version)

%define FILE "Grace_kid.s"
%define CODE "; Grace in assembly (x86_64 Linux version)%1$c%1$c%%define FILE %2$cGrace_kid.s%2$c%1$c%%define CODE %2$c%3$s%2$c%1$c%%define RUN %%macro main 0%1$c%1$cglobal _start%1$csection .data%1$c    filename db FILE, 0%1$c    format db CODE, 0%1$c    mode db %2$cw%2$c, 0%1$c%1$csection .text%1$c    extern fopen%1$c    extern fprintf%1$c    extern fclose%1$c%1$c_start:%1$c    lea rdi, [filename]%1$c    lea rsi, [mode]%1$c    call fopen%1$c    test rax, rax%1$c    jz exit%1$c%1$c    mov rbx, rax%1$c    mov rdi, rax%1$c    lea rsi, [format]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [format]%1$c    xor eax, eax%1$c    call fprintf%1$c%1$c    mov rdi, rbx%1$c    call fclose%1$c%1$cexit:%1$c    mov rax, 60%1$c    xor rdi, rdi%1$c    syscall%1$c%%endmacro%1$c%1$cRUN"

global _start
section .data
    filename db FILE, 0
    format db CODE, 0
    mode db "w", 0

section .text
    extern fopen
    extern fprintf
    extern fclose

_start:
    lea rdi, [filename]
    lea rsi, [mode]
    call fopen
    test rax, rax
    jz exit

    mov rbx, rax
    mov rdi, rax
    lea rsi, [format]
    mov rdx, 10
    mov rcx, 34
    lea r8, [format]
    xor eax, eax
    call fprintf

    mov rdi, rbx
    call fclose

exit:
    mov rax, 60
    xor rdi, rdi
    syscall

main