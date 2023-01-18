echo "Assemble manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "Assemble fill_array.asm"
nasm -f elf64 -l fill_array.lis -o fill_array.o fill_array.asm

echo "compile driver.cpp using the g++ compiler standard 2017"
g++ -c -Wall -no-pie -m64 -std=c++17 -o driver.o driver.cpp

echo "compile display.c using the g++ compiler standard 2017"
gcc -c -Wall -m64 -no-pie -o display.o display.c -std=c17

echo "Link object files using the gcc Linker standard 2017"
g++ -m64 -no-pie -o final.out manager.o fill_array.o driver.o display.o -std=c++17

echo "Run the Assignment 5 Program:"
 gdb ./final.out

echo "\n\nScript file has terminated."

#Clean up after program is run
rm *.o
rm *.out
rm *.lis