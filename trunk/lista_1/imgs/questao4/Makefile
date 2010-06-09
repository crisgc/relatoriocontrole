#
# fig4latex makefile
#

all: projetoPI.tex

# translation into pstex

projetoPI.tex: projetoPI.eps 
	fig2dev -L pstex_t -p imgs/questao4/projetoPI.eps -m 1 projetoPI.fig > projetoPI.tex

projetoPI.pdf: projetoPI.eps 
	epstopdf projetoPI.eps

projetoPI.eps: projetoPI.fig 
	fig2dev -L pstex -m 1 projetoPI.fig > projetoPI.eps

clean::
	rm -f projetoPI.tex projetoPI.eps projetoPI.pdf


