FIGSQ2 = imgs/questao2/rlocus_gma.eps imgs/questao2/compensador_malha.pstex_t \
			 imgs/questao2/rlocus_gma.eps imgs/questao2/resposta_gma.eps \
			 imgs/questao2/resposta_gcomp1.eps imgs/questao2/resposta_gcomp2.eps \
			 imgs/questao2/rlocus_gcma.eps
SCRIPTS = scripts_scilab/q2/testeKharitonov.sce

.PHONY: all
all: showpdf

imgs/questao2/rlocus_gma.eps imgs/questao2/resposta_gma.eps \
imgs/questao2/resposta_gcomp1.eps imgs/questao2/resposta_gcomp2.eps \
imgs/questao2/rlocus_gcma.eps: scripts_scilab/q2/q2.sce
	scilab -f $^

scripts_scilab/q2/temp.tex: scripts_scilab/q2/testeKharitonov.sce
	scilab -f $^

.PHONY: showpdf
showpdf: arquivo.pdf
	evince $^&

arquivo.pdf: arquivo.dvi
	dvipdf $^

arquivo.dvi: arquivo.tex comandos.tex pacotes.tex \
		     questao1.tex questao2.tex questao3.tex questao4.tex \
		     apendice_q1.tex apendice_q2.tex apendice_q3.tex apendice_q4.tex \
			 bibliografia.bib $(FIGSQ2) $(SCRIPTS) 
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
