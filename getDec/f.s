;Scan the first unsigned decimal number

section .text
global f
f:
    push ebp
    mov ebp, esp
    push ebx
    push edi
    xor ebx, ebx
    mov eax, [ebp + 8]
begin:
    mov cl, [eax]
    test cl, cl
    jz pre_eval
    cmp cl, '0'
    jl not_num
    cmp cl, '9'
    jg not_num
    mov edx, eax
num:
    inc ebx
    inc eax
    mov cl, [eax]
    test cl, cl
    jz pre_eval
    cmp cl, '0'
    jl pre_eval
    cmp cl, '9'
    jg pre_eval
    jmp num
not_num:
    inc eax
    jmp begin
pre_eval:
    mov eax, 0xffffffff
    test ebx, ebx
    jz epilog
    xor eax, eax
eval:
    dec ebx
    test ebx, ebx
    jz end
    xor edi, edi
    mov cl, [edx]
    movzx ecx, cl
    sub ecx, 48
inner:
    lea ecx, [ecx*2]
    imul ecx, 5
    inc edi
    cmp edi, ebx
    jz adding
    jmp inner
adding:
    add eax, ecx
    inc edx
    jmp eval
end:
    mov cl, [edx]
    movzx ecx, cl
    sub ecx, 48
    add eax, ecx
epilog:
    pop edi
    pop ebx
    mov esp, ebp
    pop ebp
    ret