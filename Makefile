INPUTS=$(sort $(wildcard data/*/*.yaml))
EXTENSIONS=edg gexf gml graphml
OUTPUTS=$(INPUTS:.yaml=.gml) $(INPUTS:.yaml=.graphml) $(INPUTS:.yaml=.edg) $(INPUTS:.yaml=.gexf)

default: all

.PHONY: clean setup all finalization gh-pages default

clean:
	rm -f index.html
	rm -f $(OUTPUTS)

all:
	mkdir -p www/
#	#rm -rf www/*
	cd data ; cp -r --parents . ../www/
	python3 parse.py $(INPUTS) --output www/

%.gml: %.yaml parse.py
	python3 parse.py $<
	python3 parse.py --metadata $< >> index.html
	python3 parse.py --stats $< >> index.html
	echo "<br>" >> index.html
	for ext in $(EXTENSIONS); do \
	  echo "<a href=\"$(basename $@).$$ext\">$(basename $@).$$ext</a><br>" >> index.html ; \
	done
	echo "<br><br>" >> index.html
	echo >> index.html
	echo >> index.html


gh-pages:
	make all
	cd www && git init
	cd www && git add .
	cd www && git commit --author="gh-actions <noreply@example.com>" -m "gh-pages at $$(date)"
	cd www && git remote add origin $$(cd .. && git config remote.origin.url)
	cd www && git push -u origin HEAD:gh-pages -f

