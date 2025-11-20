; This code is written for NASM (AT&T/Intel syntax) a 64-bit Linux syscally.

section .data
    prompt      db "Guess a number between 1 - 10:", 10, 0
    prompt_len  equ $-prompt

    too_low     db "Number is too low. Try again!", 10, 0
    too_low_len equ $-too_low

    too_high    db "Number is too high. Try again!", 10, 0
    too_high_len equ $-too_high

    correct     db "You guessed the right number. Well done.", 10, 0
    correct_len equ $-correct

    tries_msg   db "Remaining attempts: ", 0
    tries_msg_len equ $-tries_msg

    newline     db 10

    buf         times 32 db 0

section .bss

section .text
    global _start

_start:
    xor rax, rax
    xor rdx, rdx
    rdtsc
    xor rax, rdx
    mov rbx, 6364136223846793005
    mul rbx
    add rax, 1442695040888963407
    mov rdx, 0
    mov rbx, 10
    div rbx
    mov rsi, rdx
    add rsi, 1
    mov r12, rsi

    xor r13, r13

game_loop:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel prompt]
    mov rdx, prompt_len
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, [rel buf]
    mov rdx, 31
    syscall

    lea rsi, [rel buf]
    xor rbx, rbx
    xor rcx, rcx

parse_loop:
    mov al, [rsi + rcx]
    cmp al, 10
    je parse_done
    cmp al, 0
    je parse_done
    sub al, '0'
    cmp al, 9
    ja parse_done
    imul rbx, rbx, 10
    add rbx, rax
    inc rcx
    jmp parse_loop

parse_done:
    inc r13

    mov rax, r12
    cmp rbx, rax
    je user_correct
    jb user_low
    ja user_high

user_low:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel too_low]
    mov rdx, too_low_len
    syscall
    jmp game_loop

user_high:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel too_high]
    mov rdx, too_high_len
    syscall
    jmp game_loop

user_correct:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel correct]
    mov rdx, correct_len
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, [rel tries_msg]
    mov rdx, tries_msg_len
    syscall

    mov rbx, r13
    lea rdi, [rel buf]
    add rdi, 16
    mov rcx, 0
    cmp rbx, 0
    jne conv_loop
    mov byte [rdi], '0'
    mov rcx, 1
    jmp conv_done

conv_loop:
    xor rdx, rdx
    mov rax, rbx
    mov rsi, 10
    div rsi
    add dl, '0'
    dec rdi
    mov [rdi], dl
    inc rcx
    mov rbx, rax
    cmp rbx, 0
    jne conv_loop

conv_done:
    mov rax, 1
    mov rdi, 1
    mov rsi, rdi
    mov rdx, rcx
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, [rel newline]
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall