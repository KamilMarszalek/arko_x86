;Leave only the longest sequence of decimal digits.

section .text
global f
f:
    push ebp
    mov ebp, esp
    push ebx
    push esi ;counter
    push edi
    mov eax, [ebp + 8]
    xor esi, esi
    xor edi, edi
    mov ebx, eax
    xor edx, edx
begin:
    mov cl, [eax]
    inc eax
    cmp cl, 0
    jz save
    cmp cl, '0'
    jl reset_counter
    cmp cl, '9'
    jg reset_counter
    inc esi
    jmp begin
reset_counter:
    cmp esi, edi
    cmovg edi, esi
    jg update
    xor esi, esi
    jmp begin
update:
    mov ebx, eax ;beginning of seq
    sub ebx, edi
    xor esi, esi
    jmp begin
save:
    cmp esi, edi
    cmovg edi, esi
    cmovg ebx, eax
    cmovg edx, edi
    sub ebx, edx
    dec ebx
    mov eax, [ebp + 8]
save_loop:
    mov cl, [ebx]
    cmp edi, 0
    jz end
    mov byte [eax], cl
    inc eax
    inc ebx
    dec edi
    jmp save_loop
end:
    mov byte [eax], 0
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret