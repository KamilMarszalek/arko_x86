section .text
global f

f:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
begin:
	mov edx, [eax]
    cmp dl, 0
	jz end
    and edx, 0xFFFFFFDF
	or edx, 0x00002000
	xor edx, 0x20200000
    mov [eax], edx
	add eax, 4
	jmp begin
end:
    mov esp, ebp
    pop ebp
    ret
