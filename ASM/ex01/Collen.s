section .data
    code db "hola mundo", 0, 0xA    
    len equ $ - code                ; Calcula la len del code

section .text
    global _start                   ; Punto de entrada del programa

_start:
    ; Llamada al sistema para escribir (sys_write)
    mov rax, 1                      ; Número de syscall para escribir (1: sys_write)
    mov rdi, 1                      ; Descriptor de archivo (1: salida estándar)
    mov rsi, code                   ; Dirección del code
    mov rdx, len                    ; len del code
    syscall                         ; Invoca la llamada al sistema

    ; Llamada al sistema para salir (sys_exit)
    mov rax, 60                     ; Número de syscall para salir (60: sys_exit)
    xor rdi, rdi                    ; Código de salida (0: éxito)
    syscall                         ; Invoca la llamada al sistema


; 0xA   salto de linea \n
; 0x09  tabulador \t
; 0x22  comillas dobles "
; 0     caracter nulo '\0'