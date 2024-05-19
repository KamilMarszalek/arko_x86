;Reverse the order of letters, leaving the other chars in their place 
section .text
global f
f:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, [ebp + 8]
find_end:
    mov cl, [eax]
    test cl, cl
    jz save_end
    inc eax
    jmp find_end
save_end:
    mov ebx, eax
    mov eax, [ebp + 8]
begin:
    mov cl, [eax]
    test cl, cl
    jz end
    cmp eax, ebx
    jz end
    cmp cl, 'A'
    jl next
    cmp cl, 'Z'
    jle inner
    cmp cl, 'a'
    jl next
    cmp cl, 'z'
    jg next
inner:
    cmp ebx, eax
    mov ch, [ebx]
    jle end
    cmp ch, 'A'
    jl before
    cmp ch, 'Z'
    jle swap
    cmp ch, 'a'
    jl before
    cmp ch, 'z'
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