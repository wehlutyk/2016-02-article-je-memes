DEPS = bibliography.bib
PDFS = article.pdf auteur-titre.pdf résumés.pdf
ODFS = article.odt auteur-titre.odt résumés.odt

default: $(PDFS) $(ODFS)

%.pdf: %.md $(DEPS)
	pandoc $< -o $@ --filter pandoc-citeproc --pdf-engine=xelatex

%.odt: %.md $(DEPS)
	pandoc $< -o $@ --filter pandoc-citeproc --pdf-engine=xelatex

.PHONY: watch clean

watch:
	@inotifywait -m -e close_write --include '.*\.md$$|.*\.bib$$|Makefile' . | while read path action file; do echo; echo "$$(date --rfc-3339=seconds): $$action $$file"; make --no-print-directory $${file%.md}.pdf $${file%.md}.odt; done

clean:
	rm $(PDFS) $(ODFS)
