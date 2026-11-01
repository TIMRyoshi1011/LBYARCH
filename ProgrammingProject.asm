%include "io64.inc"
section .data
    TEXT times 21 db 0
    KEY times 21 db 0
    ENCRYPT times 21 db 0

section .text
global CMAIN
CMAIN:
    GET_STRING [TEXT], 20
    GET_UDEC 1, [KEY + 0]
    GET_UDEC 1, [KEY + 1]
    
    xor rcx, rcx    ; rcx = 0
    xor rsi, rsi    ; rsi = 0
    mov rdi, 2      ; rdi = i = 2 (for dynamic programming)
    
    ; count characters
    call count
    
    ; output 1 =  Text (ASCII)
    PRINT_STRING [TEXT]
    
    ; output 2 = Text (HEX)
    xor rsi, rsi    ; reset rsi to 0
    call hex
    
    ; output 3 = Key (HEX)
    NEWLINE
    ; print i = 0 and i = 1
    PRINT_HEX 1, [KEY + 0]
    PRINT_CHAR ' '
    PRINT_HEX 1, [KEY + 1]
    PRINT_CHAR ' '
    
    ; set and print i = 2 --> i <= n
    call key
    
    ; output 4 = Encrypt (HEX)
    xor rdi, rdi    ; reset rdi to 0
    NEWLINE
    call encrypt
    
    ; output 5 = Encrypt (ASCII)
    NEWLINE
    PRINT_STRING [ENCRYPT]
    
    xor rax, rax
    ret
 
; count function   
count:
    cmp byte [TEXT + rsi], 0
    je end
    
    inc rcx
    inc rsi
    jmp count
    
end: 
    dec rcx
    ;PRINT_DEC 8, rcx
    ;NEWLINE
    ret

; hex function   
hex:
    PRINT_HEX 1, [TEXT + rsi]
    PRINT_CHAR ' '
    inc rsi
    
    cmp rsi, rcx
    jne hex
    ret
  
; fibonacci sequence (dynamic programming)  
key:
    xor rax, rax
    xor rdx, rdx
    
    mov al, [KEY + rdi - 1]
    mov dl, [KEY + rdi - 2]
    add al, dl
    mov [KEY + rdi], al
    PRINT_HEX 1, [KEY + rdi]
    PRINT_CHAR ' '
    
    inc rdi
    cmp rdi, rcx
    jne key
    ret
    
encrypt:
    xor rax, rax
    xor rbx, rbx
    
    mov al, [TEXT + rdi]
    mov bl, [KEY + rdi]
    
    xor al, bl
    mov [ENCRYPT + rdi], al
    PRINT_HEX 1, [ENCRYPT + rdi]
    PRINT_CHAR ' '
    
    inc rdi
    cmp rdi, rcx
    jne encrypt 
    ret