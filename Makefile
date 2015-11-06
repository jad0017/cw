.SECONDARYEXPANSION:

all: main main2 ugly dreams

.PHONY: main2
main2: texfile = main2.tex
main2: pdf/main2.pdf

.PHONY: main
main: texfile = main.tex
main: pdf/main.pdf

.PHONY: ugly
ugly: texfile = ugly.tex
ugly: pdf/ugly.pdf

.PHONY: dreams
dreams: texfile = dreams.tex
dreams: pdf/dreams.pdf

.PHONY: force
force:
	@true

pdf/%.pdf: pdffile = $(texfile:.tex=.pdf)
pdf/%.pdf: force
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
