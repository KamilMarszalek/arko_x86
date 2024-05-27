section .text
global f

f:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov edx, eax
begin:
    mov cl, [eax]
    test cl, cl
    jz end
    cmp cl, '0'
    jl save
    cmp cl, '9'
    jg save
    inc eax
    jmp begin
save:
    mov [edx], cl
    inc edx
    inc eax
    jmp begin
end:
    mov [edx], byte 0
    mov esp, ebp
    pop ebp
    ret