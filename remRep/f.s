section .data
    seen db 256 dup(0)

section .text
global f
f:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    lea esi, [rel seen]
    mov eax, [ebp + 8]
    mov edi, eax
begin:
    movzx ecx, byte [eax] 
    cmp cl, 0
    jz end
    cmp byte [esi + ecx], 0
    jne skip
    mov byte [esi + ecx], 1 
    mov [edi], cl 
    inc edi
skip:
    inc eax
    jmp begin
end:
    mov byte [edi], 0 
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret