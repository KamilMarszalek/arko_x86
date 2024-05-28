; Remove odd letters

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
    cmp cl, 'A'
    jl save
    cmp cl, 'Z'
    jle check_parity
    cmp cl, 'a'
    jl save
    cmp cl, 'z'
    jg save
check_parity:
    mov ch, cl
    and ch, 1
    jz save
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