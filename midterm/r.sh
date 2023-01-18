#!/bin/bash
# author: David Fazio
# email: davidfazio1102@csu.fullerton.edu
# date: october 13, 2022
# sec: Section 7


rm *.o
rm *.out

echo "Bash: The script file for Midterm has begun"

echo "Bash: Compile the driver function" 
gcc -c -m64 -Wall -fno-pie -no-pie -o driver.o driver.c -std=c17

echo "Bash: Assemble manager.asm"
nasm -f elf64 -o manager.o manager.asm

echo "Bash: Assemble get_data.asm"
nasm -f elf64 -o input.o get_data.asm

echo "Bash: Compile show_data.cpp"
g++ -c -m64 -Wall -std=c++17 -fno-pie -no-pie -o display.o show_data.cpp

echo "Bash: Compile show_data.cpp"
g++ -c -m64 -Wall -std=c++17 -fno-pie -no-pie -o isinteger.o isinteger.cpp

echo "Bash: Assemble reverse.asm"
nasm -f elf64 -o rev.o reverse.asm

echo "Bash: Link the object files"
g++ -m64 -no-pie -o arr.out manager.o driver.o rev.o input.o display.o isinteger.o -std=c++17

echo "Bash: Run the program Integer Arithmetic:"
./arr.out

echo "The script file will terminate"