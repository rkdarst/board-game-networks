Board game networks dataset
===========================

This dataset contains networks (as in `graph theory
<https://en.wikipedia.org/wiki/Graph_theory>`_ or `complex networks
<https://en.wikipedia.org/wiki/Complex_network>`_) contained in board
games.  It is compiled for use in teaching, research, and to promote
the development of network-based games.

Formatted data is downloadable `from github pages
<https://rkdarst.github.io/board-game-networks/>`_, because this
repository contains only raw source files.  However, you probably need
to browse this repository for the readme files as well.  You can
access all the compiled data from git directly::

  git clone https://github.com/rkdarst/board-game-networks --branch gh-pages


Collecting the data
-------------------

All data is manually entered into a YAML format which provides some
built-in referential integrity checking, yet is still easy to modify
by hand.  Then, it is complied (with more integrity checking) into
other useful formats for downloading.  Raw data (not in a useful
format for network analysis) is stored in this git
repository, and processed data is put in the ``gh-pages`` branch and
published on Github Pages.

Data can be generated from the source with ``make all``.  The
``parse.py`` program converts the data to a graph format.


Internal structure and metadata
-------------------------------

There is one directory per "game", though game is not strictly
defined.  One game may include several boards (different networks),
but also some expansions can be included in the same directory.
Expansions/derivatives may be included in the same directory (and they
usually are if the rules are fundamentally the same), while related
games with significance differences in how the rules affect the
network are in a different directory.  But this is a bit inconsistent.

Each directory has a ``README.rst`` file with other information about
the game(s) in the directory, usually including some information on
the mechanics.

Each ``.yaml`` file has a ``meta:`` structure in it, with the
following keys.  Note that this includes hyperlinks, which will
eventually break, but they are included here anyway for temporary
convenience.  When one game has multiple boards, this metadata is
redundant and thus is included in only one yaml file.  This should be
improved later.

* ``name``: name of the game
* ``subname``: Variant of the game.  Usually used for the name of the board
* ``features``: Network features present in this graph.  List that
  possibly includes [``multilayer``, ``weights``, ``note-attributes``,
  ``edge-attributes``, ``node-weights``, ``regions``].  More could be added
* ``image``: Link to image of the board (note: links may be unstable)
* ``rules``: link to rules.
* ``site``: official site for the game
* ``year``: year the game was released
* ``bgg``: a site to the board game geek page
* ``type``: type of game (optional and unstructured)
* ``graph-class``: if the graph is not an undirected simple graph,
  define the graph class here.  Currently only ``MultiGraph`` is used here.
* ``fixme``: Data improvements that are needed


Status
------

Under development, formats and all are unstable.  The current gh-pages
build process is a hack.  So far almost everything is undocumented.
Graphs need more metadata.

But new graphs are welcome.  Please give suggestions for games or
add them yourself.


License
-------

All original data: CC-BY 4.0, except linked data from other sources.
Credits:

* ``bbg-*`` metadata values: `BoardGameGeek
  <https://boardgamegeek.com/wiki/page/XML_API_Terms_of_Use>`__


Code: MIT

Author and collector(s): Richard Darst

Curator: Richard Darst


**WARNING: no warranty about correctness of these networks is
provided.  Unless otherwise indicated, these networks are made by one
person and unverified.  Before using them for serious tasks, they must
be checked.  If you do check them, file an issue and I can mark it as
checked.  The entry procedure has redundancy to catch missing/excess
links, but the node and edge attributes get much less verification.**
