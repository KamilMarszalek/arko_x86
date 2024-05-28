; input: abcdABCDaAaA\0 output: AbCDAbcdAaAa\0

section .text
global f

f:
    push ebp
    mov ebp, esp
    push ebx
    push esi ; counter
    push edi
    mov edi, [ebp + 8]
    xor esi, esi
    xor edx, edx
    mov bx, 32
    mov ax, -32
begin:
    mov cl, [edi]
    test cl, cl
    jz end
    cmp esi, 0
    jz first_letter
    cmp esi, 1
    jz second_letter
    cmp esi, 2
    jz third_letter
    cmp esi, 3
    jz fourth_letter
first_letter:
    cmp cl, 'Z'
    cmovg dx, bx
    sub cl, dl
    xor dx, dx
    inc esi
    mov [edi], cl
    inc edi
    jmp begin
second_letter:
    cmp cl, 'Z'
    cmovle dx, bx
    add cl, dl
    xor edx, edx
    inc esi
    mov [edi], cl
    inc edi
    jmp begin
third_letter:
    cmp cl, 'a'
    cmovge dx, ax
    cmp cl, 'Z'
    cmovle dx, bx
    add cl, dl
    xor edx, edx
    inc esi
    mov [edi], cl
    inc edi
    jmp begin
fourth_letter:
    cmp cl, 'a'
    cmovge dx, ax
    cmp cl, 'Z'
    cmovle dx, bx
    add cl, dl
    xor esi, esi
    xor edx, edx
    mov [edi], cl
    inc edi
    jmp begin
end:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

