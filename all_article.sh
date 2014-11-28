#!/bin/bash
rm all_article.tex
grep "@" article.bib > all_article_dummytex
sed 's/@.*{/\\nocite{/g;s/,/}/g' all_article_dummytex > all_article.tex

#echo "\documentclass{article}\usepackage{showkeys,natbib} \bibliographystyle{plain} \begin{document} " > list_articles.tex
echo "\documentclass{article}\usepackage{showkeys,natbib} \bibliographystyle{chicagoa} \begin{document} " > list_articles.tex
cat all_article.tex >> list_articles.tex
echo "\bibliography{article.bib}\end{document}" >> list_articles.tex

pdflatex list_articles.tex
bibtex list_articles.aux
pdflatex list_articles.tex
pdflatex list_articles.tex



rm -f *~ *.lof *.lot  *.ps *.dvi *.blg *.aux *.toc *.idx *.ind *.ilg *.log *.out list_articles.tex all_article_dummytex   all_article.tex
