global main
extern printf
extern scanf

section .data
format: db "%u", 0
string db "max =%u min=%u",10,0
n_el equ 8

section .bss
table: resd n_el

section .text

main:

mov ebx, n_el-1

scanf_loop:
mov rdi, format
lea rsi, [table + 4*ebx]
xor eax,eax
call scanf
cmp eax,0
jz end

dec ebx 
jns scanf_loop

mov esi, 0                 ;lub xor esi, esi
mov edx, esi
dec edx                    ;edx=0xFFFFFFFF
mov ebx, n_el-1 

search_loop:
mov eax, [table+4*ebx]     ;lub xor eax, eax
cmp eax, esi               ; if(eax>esi) esi = eax

jb below
mov esi, eax

below:
cmp eax, edx               ; if(eax>esi) esi = eax

jae above
mov edx, eax

above:
dec ebx
jns search_loop


xor eax, eax
mov rdi, string
call printf
end:
ret

