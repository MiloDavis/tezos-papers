.PHONY: clean link_zh

NUMBUILDS=2

default: white_paper.pdf position_paper.pdf

link_zh:
	ln -sf position_paper.bbl position_paper_zh.bbl
	ln -sf white_paper.bbl white_paper_zh.bbl

%.pdf: link_zh
	for x in `seq $(NUMBUILDS)`; do \
		xelatex $(basename $@).tex; \
	done

clean:
	rm -f *.log *.aux *.pdf rm *.toc *.out
