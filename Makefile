.SECONDARYEXPANSION:

main_files := \
	main.tex \
	day1.tex \
	day2.tex

ugly_files := \
	ugly_story.tex \
	ugly.tex \

all: main ugly

.PHONY: main
main: texfile = main.tex
main: depend = $(main_files)
main: pdf/main.pdf

.PHONY: ugly
ugly: texfile = ugly.tex
ugly: depend = $(ugly_files)
ugly: pdf/ugly.pdf

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
