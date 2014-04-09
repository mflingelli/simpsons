pdflatex Simpsons.tex
bibtex "Simpsons"
pdflatex Simpsons.tex
pdflatex Simpsons.tex
makeindex -g -s header.ist Simpsons.idx
index.vbs
del Simpsons.ind
ren Simpsons.ind.new Simpsons.ind
pdflatex Simpsons.tex
pdflatex Simpsons.tex