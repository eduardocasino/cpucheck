# Makefile for building under Linux
#

all: cpucheck.exe

clean:
	rm -f cpucheck.exe

cpucheck.exe: cpucheck.asm exebin.mac
	nasm -fbin cpucheck.asm -o $@
