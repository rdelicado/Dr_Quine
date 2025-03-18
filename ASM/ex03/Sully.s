; Quine in assembly 

global _start
section .data
    CODE db "; Quine in assembly%1$c%1$cglobal _start%1$csection .data%1$c    CODE db %2$c%3$s%2$c%1$c    num dd 5%1$c    filename db %2$cSully_%%d.s%2$c, 0%1$c    filename_buffer times 20 db 0%1$c    compile_cmd db %2$cnasm -f elf64 Sully_%%d.s -o Sully_%%d.o && gcc -nostartfiles -no-pie -e _start -o Sully_%%d Sully_%%d.o%2$c, 0%1$c    cmd_buffer times 100 db 0%1$c    run_cmd db %2$c./Sully_%%d%2$c, 0%1$c    mode db %2$cw%2$c, 0%1$c    file_handle dq 0%1$c%1$csection .text%1$c    extern sprintf%1$c    extern fopen%1$c    extern fprintf%1$c    extern fclose%1$c    extern system%1$c%1$c_start:%1$c    mov eax, [num]%1$c    test eax, eax%1$c    jle exit%1$c%1$c    dec eax%1$c    mov [num], eax%1$c%1$c    lea rdi, [filename_buffer]%1$c    lea rsi, [filename]%1$c    mov rdx, [num]%1$c    xor eax, eax%1$c    call sprintf%1$c%1$c    lea rdi, [filename_buffer]%1$c    lea rsi, [mode]%1$c    call fopen%1$c    mov [file_handle], rax%1$c%1$c    test rax, rax%1$c    jz exit%1$c%1$c    mov rdi, [file_handle]%1$c    lea rsi, [CODE]%1$c    mov edx, 10%1$c    mov ecx, 34%1$c    lea r8, [CODE]%1$c    mov r9d, [num]%1$c    xor eax, eax%1$c    call fprintf%1$c%1$c    mov rdi, [file_handle]%1$c    call fclose%1$c%1$c    lea rdi, [cmd_buffer]%1$c    lea rsi, [compile_cmd]%1$c    mov edx, [num]%1$c    mov ecx, [num]%1$c    mov r8d, [num]%1$c    mov r9d, [num]%1$c    xor eax, eax%1$c    call sprintf%1$c%1$c    lea rdi, [cmd_buffer]%1$c    call system%1$c%1$c    lea rdi, [cmd_buffer]%1$c    lea rsi, [run_cmd]%1$c    mov edx, [num]%1$c    xor eax, eax%1$c    call sprintf%1$c%1$c    lea rdi, [cmd_buffer]%1$c    call system%1$cexit:%1$c    mov eax, 60%1$c    xor edi, edi%1$c    syscall"
    num dd 5                        ; Start with 5
    filename db "Sully_%d.s", 0     ; File pattern
    filename_buffer times 20 db 0   ; Buffer for filename
    compile_cmd db "nasm -f elf64 Sully_%d.s -o Sully_%d.o && gcc -nostartfiles -no-pie -e _start -o Sully_%d Sully_%d.o", 0
    cmd_buffer times 100 db 0       ; Buffer for commands
    run_cmd db "./Sully_%d", 0      ; Run command
    mode db "w", 0
    file_handle dq 0                ; File handle

section .text
    extern sprintf  ; For string formatting
    extern fopen    ; Open file
    extern fprintf  ; Write to file
    extern fclose   ; Close file
    extern system   ; Run system commands

_start:
    ; Check if num <= 0
    mov eax, [num]
    test eax, eax
    jle exit        ; Exit if num = 0

    ; Create filename (Sully_X.s)
    dec eax         ; num--
    mov [num], eax  ; Save back

    ; Format filename
    lea rdi, [filename_buffer]  ; First arg: buffer
    lea rsi, [filename]         ; Second arg: format
    mov edx, [num]              ; Third arg: num value
    xor eax, eax                ; Clear eax for varargs function
    call sprintf

    ; Open file
    lea rdi, [filename_buffer]  ; First arg: buffer
    lea rsi, [mode]             ; Second arg: mode "w"
    call fopen
    mov [file_handle], rax      ; Save file FD

    ; Check if open failed
    test rax, rax
    jz exit                     ; Exit if fopen failed

    ; Write the code to the file
    mov rdi, [file_handle]      ; File handle (valor, no dirección)
    lea rsi, [rel CODE]             ; Code template
    mov edx, 10                 ; Newline character
    mov ecx, 34                 ; Quote character
    lea r8, [rel CODE]              ; CODE itself
    mov r9d, [num]              ; Current number
    xor eax, eax                ; Clear eax for varargs function
    call fprintf                ; Write to file

    ; Close file
    mov rdi, [file_handle]      ; File handle
    call fclose

    ; Format compile command
    lea rdi, [cmd_buffer]       ; Buffer
    lea rsi, [compile_cmd]      ; Format
    mov edx, [num]              ; Filename number
    mov ecx, [num]              ; Object file number
    mov r8d, [num]              ; Output name
    mov r9d, [num]              ; Object file again
    xor eax, eax                ; Clear eax for varargs function
    call sprintf

    ; Execute compile command
    lea rdi, [cmd_buffer]
    call system

    ; Format run command
    lea rdi, [cmd_buffer]       ; Buffer
    lea rsi, [run_cmd]          ; Format
    mov edx, [num]              ; Executable number
    xor eax, eax                ; Clear eax for varargs function
    call sprintf

    ; Execute run command
    lea rdi, [cmd_buffer]
    call system

exit:
    ; Exit program
    mov eax, 60
    xor edi, edi
    syscall