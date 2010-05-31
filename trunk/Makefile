all: showpdf

.PHONY: showpdf
showpdf: arquivo.pdf
	evince $^

arquivo.pdf: arquivo.dvi
	dvipdf $^

arquivo.dvi: arquivo.tex questao2.tex
	latex $<
	latex $<

.PHONY: clean
clean: 
	-rm *.log *.aux *.pdf

.PHONY: commit
commit:
	svn ci Makefile *.tex imgs/*.eps --editor-cmd gedit --username crisgc1@gmail.com \
	--password hm8bW5dZ5Zs2
