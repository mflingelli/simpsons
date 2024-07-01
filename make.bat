@echo off
chcp 1252

SETLOCAL
CALL :build

EXIT /B %ERRORLEVEL%

:build
  CALL :clean
  CALL :generate
  CALL :clean
  
  echo "Creating document Simpsons.pdf finished."
EXIT /B %ERRORLEVEL%

:generate
  echo "Generating document..."
  pdflatex Simpsons.tex -quiet -f
  
  echo "Generating bibliography..."
  bibtex "Simpsons"
  
  echo "Regenerating document..."
  pdflatex Simpsons.tex -quiet -f
  
  echo "Generating index..."
  makeindex -g -s header.ist Simpsons.idx
  
  echo "Regenerating document..."
  pdflatex Simpsons.tex -quiet -f

  echo "Generating final document..."
  pdflatex Simpsons.tex -quiet -f
EXIT /B %ERRORLEVEL%

:clean
  echo "Cleaning project..."
  del *.aux
  del *.bbl
  del *.blg
  del *.brf
  del *.idx
  del *.ilg
  del *.ind
  del *.log
  del *.out
  del *.pdf
  del *.toc
EXIT /B %ERRORLEVEL%
