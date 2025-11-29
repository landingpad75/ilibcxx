bits 64

extern main
extern _init
extern _fini
extern __cxa_finalize

global _start

section .text
_start:
    xor rbp, rbp
    
    pop rdi
    mov rsi, rsp
    
    and rsp, ~0xF
    
    call _init
    
    call main
    
    mov rdi, rax
    
    call _fini
    
    mov rax, 0
    syscall
    
    hlt
