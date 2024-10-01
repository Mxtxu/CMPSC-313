# Pattern Problem

# Write a MIPS assembly language program which asks the user for an integer greater than zero. Your
# program should output a pattern based on the integer the user enters. For instance, if the user enters 5
# for input, you should output the following pattern:


# Data goes here
.data


prompt1: .asciiz "Enter a number:"

aster: .asciiz "*"

newLine: .asciiz "\n"


.text


.globl main 
.ent main

main:
    # print prompt
    li $v0, 4
    la $a0, prompt1
    syscall

    # Store the number we're using at $t0.
    li $v0, 5
    syscall
    move $t0, $v0


    # Init a count variable for outer_loop. 
    li $t1, 1

asc_outer_loop:
    # If this is true, then we're done with the ascending loop, now
    # go to begin_descend and prep for the descending loop.
    bgt $t1, $t0, begin_descend

    move $t2, $t1

asc_first_loop: 
    # if t2, our counter for the amount of asterisks
    # to print is 0, then we print a new line.
    beq $t2, 0, print_newLine_asc

    # otherwise, print a singular asterisk.
    la $a0, aster
    li $v0, 4
    syscall

    # Decrement $t2, then jump back to the beginning of the loop.
    sub $t2, $t2, 1
    j asc_first_loop

# Print a new line, and increment our outer loop counter.
print_newLine_asc:
    la $a0, newLine
    li $v0, 4
    syscall

    addi $t1, $t1, 1
    j asc_outer_loop

# Start descent
begin_descend:
    sub $t1, $t0, 1

    
# Basically the same stuff but descending instead of ascending.
desc_outer_loop:
    blez $t1, exit
    move $t2, $t1

desc_first_loop:
    beq $t2, 0, print_newLine_desc
    la $a0, aster
    li $v0, 4
    syscall

    sub $t2, $t2, 1
    j desc_first_loop

print_newLine_desc:
    la $a0, newLine
    li $v0, 4
    syscall

    sub $t1, $t1, 1
    j desc_outer_loop

exit: 

    li $v0, 10
    syscall
.end main