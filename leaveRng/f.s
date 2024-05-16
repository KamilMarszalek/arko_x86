;Leave characters with codes from a to b, a < b.
section .text
global f 
f:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov eax, [ebp + 8] ; string
    mov ebx, [ebp + 12] ; a
    mov esi, [ebp + 16] ; b
begin:
    mov cl, [eax]
    test cl, cl