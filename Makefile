.PHONY: all clean

all: sakura_kiss.pdf hacking_to_the_gate.pdf mirror-magic.pdf

%.pdf: %.ly
	lilypond $*.ly

clean:
	-rm *.pdf 2>/dev/null
