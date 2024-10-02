# Template

# Data goes here
.data
    prompt1: .asciiz "Enter a temperature: (or -99 to quit): " 
    finalPrompt: .asciiz "Average temperature: " 
    newLine: .asciiz "\n"

.text


.globl main 
.ent main

main:
    # Put sentinel val at $t0,
    li.s $f14, -99.0

    # init our sum register
    li.s $f2, 0.0

    #init a count register
    li $t2, 0

    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 6
    syscall
    mov.s $f12, $f0

while_loop:
    # If the input is -99 break.
    c.eq.s $f12, $f14
    bc1t output

    # Add the input to the sum and increment our count vars.
    add.s $f2, $f2, $f12
    addi $t2, $t2, 1

    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 6
    syscall
    mov.s $f12, $f0

    j while_loop

    
    
# while_loop:
#     beq 

    

output: 
    beq $t2, $zero, exitFinal

    mtc1 $t2, $f4
    cvt.s.w $f4, $f4

    div.s $f0, $f2, $f4

    mov.s $f12, $f0

    li $v0, 4
    la $a0, newLine
    syscall

    li $v0, 4
    la $a0, finalPrompt
    syscall

    li $v0, 2
    syscall
    

exitFinal:
    li $v0, 10
    syscall
.end main