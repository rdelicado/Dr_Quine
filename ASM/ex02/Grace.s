; Grace in assembly

%define FILE "Grace_kid.s"
%define CODE "; Grace in assembly%1$c%1$c%%define FILE %2$cGrace_kid.s%2$c%1$c%%define CODE %2$c%3$s%2$c%1$c%%define RUN%1$c%%macro main 0%1$c%1$cglobal _start%1$csection .data%1$c    filename db FILE, 0%1$c    format db CODE, 0%1$c    mode db %2$cw%2$c, 0%1$c%1$csection .text%1$c    extern fopen%1$c    extern fprintf%1$c    extern fclose%1$c%1$c_start:%1$c    lea rdi, [filename]%1$c    lea rsi, [mode]%1$c    call fopen%1$c    test rax, rax%1$c    jz exit%1$c%1$c    mov rbx, rax%1$c    mov rdi, rax%1$c    lea rsi, [format]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [format]%1$c    xor eax, eax%1$c    call fprintf%1$c%1$c    mov rdi, rbx%1$c    call fclose%1$c%1$cexit:%1$c    mov rax, 60%1$c    xor rdi, rdi%1$c    syscall%1$c%%endmacro%1$c%1$cmain"
%define RUN
%macro main 0

global _start
section .data
    filename db FILE, 0       ; File name to create
    format db CODE, 0         ; Our code as a string
    mode db "w", 0            ; "w" means "write" mode

section .text
    extern fopen              ; C function to open a file
    extern fprintf            ; C function to write to a file
    extern fclose             ; C function to close a file

_start:
    lea rdi, [filename]       ; Put file name in first arg
    lea rsi, [mode]           ; Put "w" in second arg
    call fopen                ; Open the file
    test rax, rax             ; Check if open worked
    jz exit                   ; If open failed, exit

    mov rbx, rax              ; Save file handle in rbx
    mov rdi, rax              ; Put file handle in first arg
    lea rsi, [format]         ; Put our code in second arg
    mov rdx, 10               ; Put newline (10) in third arg
    mov rcx, 34               ; Put quote (34) in fourth arg
    lea r8, [format]          ; Put our code again in fifth arg
    xor eax, eax              ; Clear eax (no float args)
    call fprintf              ; Write our code to the file

    mov rdi, rbx              ; Put file handle in first arg
    call fclose               ; Close the file

exit:
    mov rax, 60               ; System call number for exit
    xor rdi, rdi              ; Exit code 0
    syscall                   ; Call the kernel
%endmacro

main                          ; Run the macro