pdf: article.tex
	latexmk -xelatex article.tex

odf: article.tex
	pandoc article.tex -o article.odt --bibliography bibliography.bib --csl csl --reference-odt=article.real.odt

article.tex: article.md bibliography.bib
	pandoc article.md -o article.tex --natbib --latex-engine=xelatex -s
	sed -i 's/\\\def\\\labelenumi{(\(.*\))}/\\def\\labelenumi{\[\1\]}/g' article.tex

clean:
	rm article.tex article.pdf
