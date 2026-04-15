.global main
.set PROT_READ, 0x1
.set PROT_WRITE, 0x2
.set MAP_ANONYMOUS, 0x20
.set MAP_PRIVATE, 0x02
.set MB, 1024*1024
.set SIZE, 64*MB

.text
main:

mmap:
    movq $9, %rax
    xorq %rdi, %rdi
    movq $SIZE, %rsi
    movq $(PROT_READ | PROT_WRITE), %rdx
    movq $(MAP_ANONYMOUS | MAP_PRIVATE), %r10
    movq $(-1), %r8
    xorq %r9, %r9
    syscall

    cmpq $0, %rax
    jle  exit_failure

entrypoint:
    addq  $SIZE, %rax
    movq  %rax, %rsp
    movq  %rsp, %rbp
    leaq  exit(%rip), %r11
    pushq %r11
    leaq  myentrypoint(%rip), %r11
    pushq %r11
    ret

exit_failure:
    movq $1, %rax
exit:
    movq %rax, %rdi
    movq $60, %rax
    syscall
