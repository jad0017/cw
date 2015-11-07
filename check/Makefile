.SECONDARYEXPANSION:

all: main main2 ugly dreams

.PHONY: main2
main2: cfg = main2
main2: build check

.PHONY: main
main: cfg = main
main: build check

.PHONY: ugly
ugly: cfg = ugly
ugly: build check

.PHONY: dreams
dreams: cfg = dreams
dreams: build check

.PHONY: force
force:
	@true

.PHONY: build
build: CFG = $(cfg)
build: force
	@$(MAKE) -C .. $(CFG)

.PHONY: check
check: CFG = $(cfg)
check: force
	@mkdir -p out/
	pdftotext ../pdf/$(CFG).pdf out/$(CFG).txt
	./languagetool.sh out/$(CFG).txt 2>&1 | tee out/$(CFG).check.out

.PHONY: textlint
textlint: CFG = $(cfg)
textlint: force
	@mkdir -p out/
	pdftotext ../pdf/$(CFG).pdf out/$(CFG).txt
	./textlint.sh out/$(CFG).txt | tee out/$(CFG).textlint.out	


.PHONY: clean
clean:
	@rm *.log *.st
	@rm -rf out/
	@mkdir out/
