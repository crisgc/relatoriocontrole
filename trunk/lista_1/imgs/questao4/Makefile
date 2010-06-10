#
# fig4latex makefile
#

all: projetoPI.tex sist_ff.tex

# translation into pstex

projetoPI.tex: projetoPI.eps 
	fig2dev -L pstex_t -p ./projetoPI.eps -m 1 projetoPI.fig > projetoPI.tex

projetoPI.pdf: projetoPI.eps 
	epstopdf projetoPI.eps

projetoPI.eps: projetoPI.fig 
	fig2dev -L pstex -m 1 projetoPI.fig > projetoPI.eps

clean::
	rm -f projetoPI.tex projetoPI.eps projetoPI.pdf


# translation into pstex

sist_ff.tex: sist_ff.eps 
	fig2dev -L pstex_t -p ./sist_ff.eps -m 1 sist_ff.fig > sist_ff.tex

sist_ff.pdf: sist_ff.eps 
	epstopdf sist_ff.eps

sist_ff.eps: sist_ff.fig 
	fig2dev -L pstex -m 1 sist_ff.fig > sist_ff.eps

clean::
	rm -f sist_ff.tex sist_ff.eps sist_ff.pdf


