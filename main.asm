section .data
    msg db 'Hello, World!', 0xA  ; message with a newline character
    len equ $ - msg                ; calculate length of the message

section .text
    global _start

_start:
    ; write our string to stdout
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, msg        ; pointer to message
    mov rdx, len        ; message length
    syscall

    ; exit
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; exit code 0
    syscall
