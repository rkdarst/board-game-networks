INPUTS=$(sort $(wildcard */*.yaml))
EXTENSIONS=edg gexf gml graphml
OUTPUTS=$(INPUTS:.yaml=.gml) $(INPUTS:.yaml=.graphml) $(INPUTS:.yaml=.edg) $(INPUTS:.yaml=.gexf)


all: $(OUTPUTS)

clean:
	rm -f index.html
	rm -f $(OUTPUTS)

setup:
	echo 'Board game network dataset.  <a href="https://github.com/rkdarst/board-game-networks/">Information, documentation, source, metadata, etc. are available on GitHub.</a><br><br>' >> index.html
	echo 'Get all data: <tt>git clone https://github.com/rkdarst/board-game-networks --branch gh-pages</tt><br></br>'>> index.html
	echo 'This dataset is under production and is not complete or well documented yet.<br></br>'>> index.html
	echo >> index.html
	echo >> index.html

finalization:
	true

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


gh-pages: clean setup all finalization
	git br -D gh-pages && true
	git checkout --orphan gh-pages
	git add index.html *.yaml *.gexf *.gml *.graphml *.edg
	git commit -m "gh-pages at $$(date)"
	git push -u origin gh-pages -f
	git checkout master
