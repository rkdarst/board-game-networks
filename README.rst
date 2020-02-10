Board game networks dataset
===========================

This dataset contains networks (as in graph theory) contained in board
games.  It is compiled for use in teaching, research, and to promote
the concept of network-based games.

Formatted data is downloadable `from github pages
<https://rkdarst.github.io/board-game-networks/>`_, because this
repository contains only raw source files.  You can access all the
compiled data from git directly::

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


Status
------

Under development, formats and all are unstable.  The current gh-pages
build process is a hack.  So far almost everything is undocumented.
Graphs need more metadata.

But new graphs are welcome.  Please give suggestions for games or
add them yourself.

License
-------

All data: CC-BY 4.0

Code: MIT

Author and collector(s): Richard Darst

Curator: Richard Darst
