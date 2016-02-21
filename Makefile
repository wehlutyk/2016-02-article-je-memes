pdf: article.tex
	latexmk -xelatex article.tex

article.tex: article.md bibliography.bib
	pandoc article.md -o article.tex --filter pandoc-citeproc --latex-engine=xelatex -s
	sed -i 's/\\\def\\\labelenumi{(\(.*\))}/\\def\\labelenumi{\[\1\]}/g' article.tex

clean:
	rm article.tex article.pdf
