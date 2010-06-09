FIGSQ2 = imgs/questao2/rlocus_gma.eps imgs/questao2/compensador_malha.pstex_t \
			 imgs/questao2/rlocus_gma.eps imgs/questao2/resposta_gma.eps \
			 imgs/questao2/resposta_gcomp1.eps imgs/questao2/resposta_gcomp2.eps \
			 imgs/questao2/rlocus_gcma.eps 
FIGSQ4 = imgs/questao4/projetoPI.tex imgs/questao4/saida_mf.eps \
				 imgs/questao4/saida_comp_mf.eps imgs/questao4/rlocus_cmf.eps
SCRIPTS = scripts_matlab/q2_kharitonov_a.m scripts_matlab/q2_kharitonov_b.m \
					scripts_matlab/q2_simulacoes.m

.PHONY: all
all: showpdf

# Regra geral para formar os .eps
%.eps: %.jpg
	convert $^ $@

imgs/questao4/projetoPI.tex: imgs/questao4/projetoPI.fig imgs/questao4/Makefile
	cd imgs/questao4 && make

imgs/questao4/Makefile: 
	cd imgs/questao4 && fig4latex -d 'imgs/questao4/'

.PHONY: showpdf
showpdf: arquivo.pdf
	evince $^&

arquivo.pdf: arquivo.dvi
	dvipdf $^

arquivo.dvi: arquivo.tex comandos.tex pacotes.tex \
		     questao1.tex questao2.tex questao3.tex questao4.tex \
		     apendice_q1.tex apendice_q2.tex apendice_q3.tex apendice_q4.tex \
			 bibliografia.bib $(FIGSQ2) $(FIGSQ4) $(SCRIPTS) 
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
