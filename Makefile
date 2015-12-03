all: out draft.pdf


SRCGRAPHS = $(wildcard *.dot)
SVGGRAPHS = $(patsubst %.dot,out/%.eps,$(SRCGRAPHS))

out:
	mkdir out

draft.pdf: draft.lytex $(SVGGRAPHS)
	 lilypond-book --output=out --pdf draft.lytex  && cd out && pdflatex -shell-escape draft.tex && cd ..
	 cp out/draft.pdf draft.pdf

out/%.eps: %.dot
	neato -Teps $< > $@ 

clean:
	rm -rf out
	rm -f *.svg
	rm -f *.ps
	rm -f *.pdf
	rm -f *.eps
