; Remove last decimal num

section .text
global f
f:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, [ebp + 8]
    xor ebx, ebx
    xor edx, edx
begin:
    mov cl, [eax]
    cmp cl, 0
    jz rem_num
    cmp cl, '0'
    jl not_num
    cmp cl, '9'
    jg not_num
    mov ebx, eax
    xor edx, edx
num:
    inc edx
    inc eax
    mov cl, [eax]
    cmp eax, 0
    jz rem_num
    cmp cl, '0'
    jl begin
    cmp cl, '9'
    jg begin
    jmp num
not_num:
    inc eax
    jmp begin
rem_num:
    mov eax, ebx
    add ebx, edx
loop:
    cmp edx, 0
    jz end
    mov cl, [ebx]
    mov [eax], cl
    cmp cl, 0
    jz end
    inc eax
    inc ebx
    jmp loop
end:
    pop ebx
    mov esp, ebp
    pop ebp
    ret
