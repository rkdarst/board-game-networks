INPUTS=$(wildcard */*.yaml)
EXTENSIONS=gml graphml edg
OUTPUTS=$(INPUTS:.yaml=.gml) $(INPUTS:.yaml=.graphml)


all: $(OUTPUTS)

clean:
	rm -f index.html
	rm -f $(OUTPUTS)

%.gml: %.yaml parse.py
	python3 parse.py $<
	for ext in $(EXTENSIONS); do \
	  echo "<a href=\"$(basename $@).$$ext\">$(basename $@).$$ext</a>" >> index.html ; \
	done
