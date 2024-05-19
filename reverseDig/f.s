; Reverse the order of digits, leaving the other chars in their places.

section .text
global f
f:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, [ebp + 8]
find_end:
    mov cl, [eax]
    cmp cl, 0
    jz save_end
    inc eax
    jmp find_end
save_end:
    mov ebx, eax
    mov eax, [ebp + 8]
begin:
    mov cl, [eax]
    cmp cl, 0
    jz end
    cmp eax, ebx
    jz end
    cmp cl, '0'
    jl next
    cmp cl, '9'
    jg next
inner:
    cmp ebx, eax
    jle end
    mov ch, [ebx]
    cmp ch, '0'
    jl before
    cmp ch, '9'
    jg before
swap:
    mov [eax], ch
    mov [ebx], cl
    dec ebx
next:
    inc eax
    jmp begin
before:
    dec ebx
    jmp inner
end:
    pop ebx
    mov esp, ebp
    pop ebp
    ret