all: showpdf

showpdf: arquivo.pdf
	evince $^

arquivo.pdf: arquivo.dvi
	dvipdf $^

arquivo.dvi: arquivo.tex questao2.tex
	latex $<
	latex $<

clean: 
	-rm *.log *.aux *.pdf

.PHONY: commit
commit:
	svn ci Makefile *.tex --editor-cmd gedit --username crisgc1@gmail.com \
	--password hm8bW5dZ5Zs2
