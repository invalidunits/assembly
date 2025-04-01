
.PHONY: all
%.o: %.asm
	yasm -a x86 -m amd64 -f macho64 -o $@ $^ 
%.out: %.o
	arch -x86_64 gcc -g -m64 -o $@ $^ -Wl,-no_pie -lc

clean:
	rm *.out
	rm *.o
