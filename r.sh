#!/bin/bash

#Author: Hoanh Vo
#Author email: hvo123@csu.fullerton.edu
#Assigment 4
#Purpose: This program compiles files, links objects and create executable file.



rm *.out
rm *.o

echo "Compile the driver module............................"

gcc -c -m64 -g -Wall -o cMain.o Main.c -fno-pie -no-pie

echo "Assemble the control module.........................."

nasm -f elf64 -g -l asmControl.lis -o asmContr.o Control.asm

echo "Compile the Display module..........................."
gcc -c -Wall -m64 -g -fno-pie -no-pie -o cppDis.o Display.c

echo "Compile the Fill module.............................."
g++ -c -Wall -m64 -std=c++14 -fno-pie -no-pie -o cppFill.o Fill.cpp

echo "Compile the Sum module..............................."
nasm -f elf64 -g -l asmSum.lis -o asmSum.o Sum.asm

echo "Link five object files..............................."
g++ -Wall -m64 -g -o Final.out cMain.o asmContr.o cppFill.o cppDis.o asmSum.o -fno-pie -no-pie



echo "Run the executable-final File........................"
./Final.out

echo "The Bash file says good-bye.........................."
