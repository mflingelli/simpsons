#!/bin/bash

pdflatex Simpsons.tex
bibtex "Simpsons"
pdflatex Simpsons.tex
pdflatex Simpsons.tex
makeindex -g -s header.ist Simpsons.idx
# TODO: Fix index
del Simpsons.ind
ren Simpsons.ind.new Simpsons.ind
pdflatex Simpsons.tex
pdflatex Simpsons.tex
