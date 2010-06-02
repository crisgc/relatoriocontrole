all: showpdf

.PHONY: showpdf
showpdf: arquivo.pdf
	evince $^&

arquivo.pdf: arquivo.dvi
	dvipdf $^

arquivo.dvi: arquivo.tex comandos.tex pacotes.tex \
		     questao1.tex questao2.tex questao3.tex questao4.tex
	latex $<
	latex $<

.PHONY: clean
clean: 
	-rm *.log *.aux *.dvi arquivo.pdf

.PHONY: commit
commit:
	svn ci Makefile *.tex imgs/*.eps --editor-cmd gedit --username crisgc1@gmail.com \
	--password hm8bW5dZ5Zs2
