section .text
global f
f:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov ebx, [ebp + 8]
    mov ecx, [ebp + 12]
    mov esi, ebx
    mov edi, ecx
begin:
    mov dl, [ebx]
    cmp dl, 0
    jz end
    dec edi
    jnz save

    inc ebx
    mov edi, ecx
    jmp begin
save:
    mov [esi], dl
    inc esi
    inc ebx
    jmp begin
end:
    mov byte[esi], 0
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret