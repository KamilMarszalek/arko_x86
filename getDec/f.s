;Scan the first unsigned decimal number

section .text
global f
f:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    xor ebx, ebx
    xor esi, esi
    mov eax, [ebp + 8]
begin:
    mov cl, [eax]
    cmp cl, 0
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
    cmp cl, 0
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
    xor eax, eax
eval:
    dec ebx
    cmp ebx, 0
    jz end
    xor edi, edi
    mov cl, [edx]
    movzx ecx, cl
    sub ecx, 48
inner:
    imul ecx, 10
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
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
    


    
