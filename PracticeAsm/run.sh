#!/bin/bash

#Author: Michael Ball
#Date: October 13 2022
#Section 7

#Purpose: script file to run the program files together.
#Clear any previously compiled outputs
rm *.o
rm *.out
rm *.lis

echo "Assemble _start.asm"
nasm -f elf64 -l _start.lis -o _start.o _start.asm
nasm -f elf64 -l strlen.lis -o strlen.o strlen.asm

echo "Create executable"
ld -o final.out _start.o strlen.o

echo "Run the program"
./final.out

echo "Script file has terminated."

#Clean up after program is run
