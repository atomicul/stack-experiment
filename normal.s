.global main
.text
main:
    subq $8, %rsp
    call myentrypoint

exit:
    movq %rax, %rdi
    movq $60, %rax
    syscall
