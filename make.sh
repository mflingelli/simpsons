#!/bin/bash

pdflatex Simpsons.tex
bibtex "Simpsons"
pdflatex Simpsons.tex
pdflatex Simpsons.tex
makeindex -g -s header.ist Simpsons.idx
pdflatex Simpsons.tex
pdflatex Simpsons.tex

rm *.aux
rm *.bbl
rm *.blg
rm *.brf
rm *.idx
rm *.ilg
rm *.ind
rm *.log
rm *.out
rm *.gz
rm *.toc

exit 0
