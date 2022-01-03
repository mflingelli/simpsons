#!/bin/bash

echo "Cleaning..."
rm -f *.aux
rm -f *.bak
rm -f *.bbl
rm -f *.blg
rm -f *.brf
rm -f *.idx
rm -f *.ind
rm -f *.log
rm -f *.out
rm -f *.toc

echo "Generating document..."
pdflatex Simpsons.tex  > /dev/null 2>&1

echo "Generating bibliography..."
bibtex "Simpsons"

echo "Regenerating document..."
pdflatex Simpsons.tex  > /dev/null 2>&1

echo "Generating index..."
makeindex -g -s header.ist Simpsons.idx

echo "Regenerating document..."
pdflatex Simpsons.tex  > /dev/null 2>&1

echo "Generating final document..."
pdflatex Simpsons.tex  > /dev/null 2>&1

exit 0
