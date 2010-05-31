all: clean principal

principal: arquivo.tex
	pdflatex arquivo
	pdflatex arquivo
	evince arquivo.pdf&

clean: 
	-rm *.log *.aux *.pdf
