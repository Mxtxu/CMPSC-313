#  Name and general description of program
# ---------------------------------------

#  Data declarations go in this section.
.data
    prompt: .asciiz "Please enter a number (Do this 9 times): " 

# program specific data declarations

# ---------------------------------------
#  Program code goes in this section.
.text

.globl main
.ent main
main:

# ----
# your program code goes here.
    # loop 9 times 
    li $t0, 9 
    # ----
    #  Done, terminate program.
    li $v0, 10
    syscall

input_loop:
    beq $t0, $zero, done_input



     

    
.end main
# all done