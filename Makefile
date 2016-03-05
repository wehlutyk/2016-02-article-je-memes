.PHONY: odf

odf: article.md bibliography.bib
	pandoc article.md -o article.odt --bibliography bibliography.bib --csl csl --reference-odt=article.real.odt
