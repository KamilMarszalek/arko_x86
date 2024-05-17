;Remove characters with codes from a to b, a < b

section .text
global f
f:
    push    ebp
    mov     ebp, esp
    push    esi
    push    edi
    mov     esi, [ebp+8]
    mov     cl, byte [ebp+12]
    mov     dl, byte [ebp+16]
    cmp     cl, dl
    jle     skip_swap
    xchg    cl, dl
skip_swap:
    mov     edi, esi
begin:  
    mov     al, [esi]
    cmp     al, 0
    jz      end
    cmp     al, cl
    jl      save
    cmp     al, dl
    jle      next
save:
    mov     [edi], al
    inc     edi
next:
    inc     esi
    jmp     begin
end:
    mov     byte[edi], 0
    pop     edi
    pop     esi
    pop     ebp
    ret
    