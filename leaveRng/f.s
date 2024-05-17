;Leave characters with codes from a to b, a < b.
section .text
global f 
f:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, [ebp + 8] ; string
    mov bl, [ebp + 12] ; a
    mov cl, [ebp + 16] ; b
    mov edx, eax
begin:
    mov ch, [eax]
    cmp ch, 0
    jz end
    cmp ch, bl
    jl skip
    cmp ch, cl
    jg skip
    jmp save
save:
    mov [edx], ch
    inc edx
    inc eax
    jmp begin
skip:
    inc eax
    jmp begin
end:
    mov [edx], byte 0
    pop ebx
    mov esp, ebp
    pop ebp 
    ret

