
EXTENSIONS = ['yaml', 'gml', 'gexf', 'graphml', 'edg']
NETS = [x for x in glob_wildcards('{net}.yaml').net if not x.startswith('www')]

rule all:
    input:
        expand("generated/{net}.gml", net=NETS),

rule generate:
    input:
        parse = "parse.py",
        netdef = "{net}.yaml",
    output:
        "generated/{net}.gml",
        "generated/{net}.edg",
        "generated/{net}.gexf",
        "generated/{net}.graphml",
        meta="tmp/{net}.meta.html",
        stats="tmp/{net}.stats.html",
    shell:
        """
        mkdir -p generated/
        python3 {input.parse} {input.netdef} -o generated/
        python3 {input.parse} --metadata {input.netdef} > {output.meta}
	python3 {input.parse} --stats {input.netdef} > {output.stats}
        """


rule clean:
    priority: 100
    shell:
        """
        rm -rf www/ tmp/ generated/
        """

rule html:
#    input:
#        meta=expand("tmp/{net}.meta.html", net=NETS),
#        stats=expand("tmp/{net}.stats.html", net=NETS),
#    output:
#        touch('tmp/html.done'),
#        "www/index.html",
    shell:
        """
        set -x
        cat tmp/root/green.meta.html >> output
        """
        #mkdir -p www/
        #rm -f {output}
	#echo 'Board game network dataset.  <a href="https://github.com/rkdarst/board-game-networks/">Information, documentation, source, metadata, etc. are available on GitHub.</a><br><br>' '>>' {output}
	#echo 'Get all data: <tt>git clone https://github.com/rkdarst/board-game-networks --branch gh-pages</tt><br></br>' '>>' {output}
	#echo 'This dataset is under production and is not complete or well documented yet.<br></br>' '>>' {output}
	#echo '>>' {output}
	#echo '>>' {output}
        #mkdir -p tmp/
        #touch tmp/init
        #
        #mkdir -p www/
#        for basename in {NETS} ; do
            #for ext in {EXTENSIONS}; do
            #  echo "<a href=\"$basename.$ext\">$basename.$ext</a><br>" '>>' {output}
            #done
            #echo "<br><br>" '>>' {output}
#            cat tmp/$basename.meta.html >> {output}
            #cat tmp/$basename.stats.html >> {output}
            #echo "<br>" '>>' {output}
            #echo '>>' {output}
	    #echo '>>' {output}
#        done

rule copydata:
    input:
        expand("{net}.yaml", net=NETS),
        expand("generated/{net}.gml", net=NETS),
        expand("generated/{net}.edg", net=NETS),
        expand("generated/{net}.gexf", net=NETS),
        expand("generated/{net}.graphml", net=NETS),
    output:
        touch('tmp/copydata.done'),
    shell:
        """
        mkdir -p www/
        for name in {input} ; do
            cp -p $name www/
        done
        """

rule www:
    input:
        "tmp/copydata.done",
        "tmp/html.done",


rule test:
    output:
        "output"
    shell:
        """
        set -x
        for x in 1 2 3 ; do
            cat /dev/null >> output
        done
        """
