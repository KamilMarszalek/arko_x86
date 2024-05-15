;Leave last n digits, removing all other characters.

section .text
global f
f:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    xor edi, edi ;number of digits
    xor esi, esi ; clear esi
begin:
    mov cl, [eax]
    cmp cl, 0
    jz prep
    cmp cl, '0'
    jl next
    cmp cl, '9'
    jg next
    inc edi
next:
    inc eax
    jmp begin
prep:
    mov eax, [ebp + 8]
    mov esi, eax
loop:
    mov cl, [eax]
    cmp cl, 0
    jz end
    cmp cl, '0'
    jl skip_non_dig
    cmp cl, '9'
    jg skip_non_dig
    cmp edi, ebx
    jle save
    dec edi
skip_dig:
    inc eax
    jmp loop
skip_non_dig:
    inc eax
    jmp loop
save:
    mov [esi], cl
    inc esi
    inc eax
    jmp loop
end:
    mov byte [esi], 0
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret