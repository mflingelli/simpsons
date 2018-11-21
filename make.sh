#!/bin/bash

pdflatex Simpsons.tex
bibtex "Simpsons"
pdflatex Simpsons.tex
pdflatex Simpsons.tex
makeindex -g -s header.ist Simpsons.idx
pdflatex Simpsons.tex
pdflatex Simpsons.tex

exit 0
