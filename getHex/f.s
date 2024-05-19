;Scan the first hexadecimal number found in a string

section .text
global f
f:
    push ebp
    mov ebp, esp
    push ebx ; start of num
    push edi
    mov eax, [ebp + 8] ; buf
    xor edx, edx ; len of num
begin:
    mov cl, [eax]
    cmp cl, 0
    jz pre_eval
    cmp cl, '0'
    jl not_num
    cmp cl, '9'
    mov ebx, eax
    jle num
    cmp cl, 'A'
    jl not_num
    cmp cl, 'F'
    jle num
    cmp cl, 'a'
    jl not_num
    cmp cl, 'f'
    jg not_num
    mov ebx, eax
num:
    inc edx
    inc eax
    mov cl, [eax]
    cmp cl, 0
    jz pre_eval
    cmp cl, '0'
    jl pre_eval
    cmp cl, '9'
    jle num
    cmp cl, 'A'
    jl pre_eval
    cmp cl, 'F'
    jle num
    cmp cl, 'a'
    jl pre_eval
    cmp cl, 'f'
    jg pre_eval
    jmp num
not_num:
    inc eax
    jmp begin
pre_eval:
    mov eax, 0xffffffff
    cmp edx, 0
    jz epilog
    xor eax, eax
eval:
    dec edx
    test edx, edx
    jz end
    xor edi, edi
    mov cl, [ebx]
    movzx ecx, cl
    sub ecx, 48
    cmp ecx, 16
    jl inner
hex_up:
    sub ecx, 7
    cmp ecx, 16
    jl inner
hex_low:
    sub ecx, 32
inner:
    lea ecx, [ecx*4]
    lea ecx, [ecx*4]
    inc edi
    cmp edi, edx
    jz adding
    jmp inner
adding:
    add eax, ecx
    inc ebx
    jmp eval
end:
    mov cl, [ebx]
    movzx ecx, cl
    sub ecx, 48
    cmp ecx, 16
    jl add_end
hex_upper_end:
    sub ecx, 7
    cmp ecx, 16
    jl add_end
hex_lower_end:
    sub ecx, 32
add_end:
    add eax, ecx
epilog:
    pop edi
    pop ebx
    mov esp, ebp
    pop ebp
    ret