; Capitalize the first character of each word in a string

section .text
global f 

f:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ch, 32
    mov edx, eax
    inc edx

first_char:
    mov cl, [eax]
    test cl, cl
    jz end
    cmp cl, 'a'
    cmovl eax, edx
    jl begin
    cmp cl, 'z'
    cmovg eax, edx
    jg begin
    sub cl, ch
    mov [eax], cl
    inc eax

begin:
    mov cl, [eax]
    test cl, cl
    jz end
    cmp cl, ' '
    jz space
    inc eax
    jmp begin

space:
    inc eax
    mov cl, [eax]
    test cl, cl
    jz end
    cmp cl, ' '
    jz space
    cmp cl, 'a'
    jl begin
    cmp cl, 'z'
    jle capitalize
    jmp begin

capitalize:
    sub cl, ch
    mov [eax], cl
    inc eax
    jmp begin

end:
    mov esp, ebp
    pop ebp
    ret
