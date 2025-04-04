; Quine in assembly

global _start
section .data
    CODE db "; Quine in assembly%1$c%1$cglobal _start%1$csection .data%1$c    CODE db %2$c%3$s%2$c%1$c    num dd 5%1$c    filename db %2$cSully_%%d.s%2$c, 0%1$c    filename_buffer times 100 db 0%1$c    compile_cmd db %2$cnasm -f elf64 Sully_%%d.s -o Sully_%%d.o && gcc -nostartfiles -no-pie -e _start -o Sully_%%d Sully_%%d.o%2$c, 0%1$c    cmd_buffer times 300 db 0%1$c    run_cmd db %2$c./Sully_%%d%2$c, 0%1$c    mode db %2$cw%2$c, 0%1$c    file_handle dq 0%1$c%1$csection .text%1$c    extern sprintf%1$c    extern fopen%1$c    extern fprintf%1$c    extern fclose%1$c    extern system%1$c%1$c_start:%1$c    mov eax, [num]%1$c    test eax, eax%1$c    jle exit%1$c%1$c    dec eax%1$c    mov [num], eax%1$c%1$c    lea rdi, [filename_buffer]%1$c    lea rsi, [filename]%1$c    mov rdx, [num]%1$c    xor eax, eax%1$c    call sprintf%1$c%1$c    lea rdi, [filename_buffer]%1$c    lea rsi, [mode]%1$c    call fopen%1$c    mov [file_handle], rax%1$c%1$c    test rax, rax%1$c    jz exit%1$c%1$c    mov rdi, [file_handle]%1$c    lea rsi, [CODE]%1$c    mov edx, 10%1$c    mov ecx, 34%1$c    lea r8, [CODE]%1$c    mov r9d, [num]%1$c    xor eax, eax%1$c    call fprintf%1$c%1$c    mov rdi, [file_handle]%1$c    call fclose%1$c%1$c    lea rdi, [cmd_buffer]%1$c    lea rsi, [compile_cmd]%1$c    mov edx, [num]%1$c    mov ecx, [num]%1$c    mov r8d, [num]%1$c    mov r9d, [num]%1$c    xor eax, eax%1$c    call sprintf%1$c%1$c    lea rdi, [cmd_buffer]%1$c    call system%1$c%1$c    lea rdi, [cmd_buffer]%1$c    lea rsi, [run_cmd]%1$c    mov edx, [num]%1$c    xor eax, eax%1$c    call sprintf%1$c%1$c    lea rdi, [cmd_buffer]%1$c    call system%1$cexit:%1$c    mov eax, 60%1$c    xor edi, edi%1$c    syscall"
    num dd 5
    filename db "Sully_%d.s", 0
    filename_buffer times 100 db 0
    compile_cmd db "nasm -f elf64 Sully_%d.s -o Sully_%d.o && gcc -nostartfiles -no-pie -e _start -o Sully_%d Sully_%d.o", 0
    cmd_buffer times 300 db 0
    run_cmd db "./Sully_%d", 0
    mode db "w", 0
    file_handle dq 0

section .text
    extern sprintf
    extern fopen
    extern fprintf
    extern fclose
    extern system

_start:
    mov eax, [num]
    test eax, eax
    jle exit

    dec eax
    mov [num], eax

    lea rdi, [filename_buffer]
    lea rsi, [filename]
    mov rdx, [num]
    xor eax, eax
    call sprintf

    lea rdi, [filename_buffer]
    lea rsi, [mode]
    call fopen
    mov [file_handle], rax

    test rax, rax
    jz exit

    mov rdi, [file_handle]
    lea rsi, [CODE]
    mov edx, 10
    mov ecx, 34
    lea r8, [CODE]
    mov r9d, [num]
    xor eax, eax
    call fprintf

    mov rdi, [file_handle]
    call fclose

    lea rdi, [cmd_buffer]
    lea rsi, [compile_cmd]
    mov edx, [num]
    mov ecx, [num]
    mov r8d, [num]
    mov r9d, [num]
    xor eax, eax
    call sprintf

    lea rdi, [cmd_buffer]
    call system

    lea rdi, [cmd_buffer]
    lea rsi, [run_cmd]
    mov edx, [num]
    xor eax, eax
    call sprintf

    lea rdi, [cmd_buffer]
    call system
exit:
    mov eax, 60
    xor edi, edi
    syscall