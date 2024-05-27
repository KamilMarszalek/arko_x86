; Bubble sort in x86

section .text
global f

f:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, [ebp + 8]
    mov edx, eax
find_end:
    mov cl, [eax]
    test cl, cl
    jz store_end
    inc eax
    jmp find_end
store_end:
    mov ebx, eax
    mov eax, edx
outer_loop:
    mov eax, [ebp + 8]
    mov edx, [ebp + 8]
    inc edx
    cmp edx, ebx
    jz end
inner_loop:
    cmp edx, ebx
    jz outer_next
    mov cl, [eax]
    mov ch, [edx]
    cmp cl, ch
    jg swap
inner_next:
    inc edx
    inc eax
    jmp inner_loop
swap:
    mov [eax], ch
    mov [edx], cl
    jmp inner_next
outer_next:
    dec ebx
    jmp outer_loop
end:
    pop ebx
    mov esp, ebp
    pop ebp
    ret
