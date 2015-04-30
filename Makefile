.PHONY: all clean

all: sakura_kiss.pdf

sakura_kiss.pdf:
	lilypond sakura_kiss.ly

clean:
	-rm sakura_kiss.pdf 2>/dev/null
