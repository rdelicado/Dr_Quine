; Quine in assembly

section .data
    code db "; Quine in assembly%1$c%1$csection .data%1$c    code db %2$c%3$s%2$c%1$c%1$csection .text%1$c    global _main%1$c    extern _printf%1$c    extern _fflush%1$c%1$c_main:%1$c    sub rsp, 8  ; Aling the stack to 16 bytes%1$c    call argv%1$c    call _printf%1$c    add rsp, 8  ; Restore the stack%1$c%1$c    ; fflush(NULL) empty all buffers%1$c    xor rdi, rdi%1$c    call _fflush%1$c%1$c    ; exit the program%1$c    mov rax, 0x2000001  ; macOS exit syscall%1$c    xor rdi, rdi%1$c    syscall%1$c%1$cargv:%1$c    lea rdi, [rel code]%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    lea rcx, [rel code]%1$c    xor rax, rax%1$c    ret"

section .text
    global _main
    extern _printf
    extern _fflush

_main:
    sub rsp, 8  ; Aling the stack to 16 bytes
    call argv
    call _printf
    add rsp, 8  ; Restore the stack

    ; fflush(NULL) empty all buffers
    xor rdi, rdi
    call _fflush

    ; exit the program
    mov rax, 0x2000001  ; macOS exit syscall
    xor rdi, rdi
    syscall

argv:
    lea rdi, [rel code]
    mov rsi, 10
    mov rdx, 34
    lea rcx, [rel code]
    xor rax, rax
    ret