# Template

# Data goes here
.data
    prompt1: .asciiz "Enter a temperaturo (or -99 to quit): " 

.text


.globl main 
.ent main

main:
    # Put sentinel val at $t0,
    li $t0, -99

    # init our sum register
    li $t1, 0

    #init a count register
    li $t2, 0

    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t4, $v0

while_loop:
    # If the input is -99 break.
    beq $t4, $t0, exit

    # Add the input to the sum and increment our count vars.
    add $t1, $t1, $t4
    addi $t2, $t2, 1

    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t4, $v0

    j while_loop

    
    
# while_loop:
#     beq 

    

exit: 
    div $t1, $t2
    
    li $v0, 10
    syscall

.end main