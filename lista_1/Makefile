FIGS = imgs/questao2/rlocus_g_ma.eps imgs/questao2/compensador_malha.pstex_t
SCRIPTS = scripts_scilab/q2/testeKharitonov.sce

.PHONY: all
all: showpdf

.PHONY: showpdf
showpdf: arquivo.pdf
	evince $^&

arquivo.pdf: arquivo.dvi
	dvipdf $^

arquivo.dvi: arquivo.tex comandos.tex pacotes.tex \
		     questao1.tex questao2.tex questao3.tex questao4.tex \
		     apendice_q1.tex apendice_q2.tex apendice_q3.tex apendice_q4.tex \
			 bibliografia.bib $(FIGS) $(SCRIPTS) 
	latex $<
	bibtex arquivo
	latex $<
	latex $<

.PHONY: clean
clean: 
	-rm *.log *.aux *.dvi *.bbl *.blg arquivo.pdf

.PHONY: commit
commit:
	svn ci Makefile *.tex imgs/*.eps --editor-cmd gedit --username \
		crisgc1@gmail.com --password hm8bW5dZ5Zs2
