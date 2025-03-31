
.PHONY: all
all: ex1.out ex2.out

ex2.out: ex2.asm
	yasm -a x86 -m amd64 -f macho64 -o ex2.o ex2.asm
	arch -x86_64 gcc -g -m64 -o ex2.out ex2.o -Wl,-no_pie -lc
ex1.out: ex1.asm
	yasm -a x86 -m amd64 -f macho64 -o ex1.o ex1.asm
	arch -x86_64 gcc -g -m64 -o ex1.out ex1.o -Wl,-no_pie -lc

clean:
	rm *.out
	rm *.o
