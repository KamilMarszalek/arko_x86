section .text
global f

f:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, [ebp + 8]
    mov ebx, eax
    inc ebx
begin:
    mov cl, [eax]
    test cl, cl
    jz end
    mov ch, [ebx]
    test ch, ch
    jz end
    mov [eax], ch
    mov [ebx], cl
    add eax, 2
    add ebx, 2
    jmp begin
end:
    pop ebx
    mov esp, ebp
    pop ebp
    ret
