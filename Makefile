.PHONY: all clean
all: mylist.pdf clean

mylist.pdf: mylist.tex
	pdflatex mylist.tex
	bibtex mylist.aux
	pdflatex mylist.tex
	pdflatex mylist.tex

mylist.tex: article.bib
	echo "\documentclass{article}\usepackage{showkeys,natbib}\\\bibliographystyle{chicagoa}\\\begin{document} " > mylist.tex
	grep "@" article.bib | sed 's/@.*{/\\nocite{/g;s/,/}/g' >> mylist.tex
	echo "\\\bibliography{article.bib}\end{document}" >> mylist.tex

clean:
	rm mylist.tex -f *~ *.lof *.lot  *.ps *.dvi *.blg *.aux *.toc *.idx *.ind *.ilg *.log *.out *.bbl
