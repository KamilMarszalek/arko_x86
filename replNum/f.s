; Replace each sequence of digits with a specified single character

section .text
global f 

f:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ch, [ebp + 12]
    mov edx, eax
begin:
    mov cl, [eax]
    test cl, cl
    jz end
    cmp cl, '0'
    jl save
    cmp cl, '9'
    jg save
    mov [edx], ch
    inc edx
num:
    inc eax
    mov cl, [eax]
    test cl, cl
    jz end
    cmp cl, '0'
    jl save
    cmp cl, '9'
    jg save
    jmp num
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
