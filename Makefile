# Makefile for mcfeynman.tex
#

IMGSTATICDIR=img/static

FILES =	mcfeynman.pkg.sty\
	mcfeynman.defs.sty\
	portada/portada.tex\
	tablacontenidos/tablacontenidos.tex\
	teoria/mc.tex\
	$(IMGSTATICDIR)/Cc-by-nc-sa_icon.eps

mcfeynman.pdf: mcfeynman.tex $(FILES)

%.pdf:	%.tex
	lualatex --enable-write18 $<
	lualatex --enable-write18 $<

$(IMGSTATICDIR)/%.eps: $(IMGSTATICDIR)/%.svg
	inkscape $< -o $@ --export-ignore-filters --export-ps-level=3


all: mcfeynman.pdf

.PHONY: clean

clean:
	rm -rf *.pdf *.ps *.dvi *.aux *.log *.toc *~ *.dat *.script
	rm -rf teoria/*.aux teoria/*~
	rm -rf portada/*.aux portada/*~
	rm -rf tablacontenidos/*.aux tablacontenidos/*~
	rm -rf prologo/*.aux prologo/*~
	rm -rf apendices/*.aux apendices/*~

