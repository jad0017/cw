texfile ?= main.tex

all: realclean main ugly

.PHONY: main
main: texfile = main.tex
main: pdf/main.pdf

.PHONY: ugly
ugly: texfile = ugly.tex
ugly: pdf/ugly.pdf

pdf/%.pdf: pdffile = $(texfile:.tex=.pdf)
pdf/%.pdf: 
	@pdflatex $(texfile)
	@pdflatex $(texfile)
	@mv $(pdffile) $@
	@rm -f *.aux *.log *.toc

.PHONY: clean
clean:
	@rm -f *.aux *.log *.toc

.PHONY: realclean
realclean: clean
	@rm -rf pdf/
	@mkdir pdf/
