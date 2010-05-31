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
