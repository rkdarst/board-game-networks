Board game networks dataset
===========================

This dataset contains networks contained in board games.

Data is downloadable `from github pages
<https://rkdarst.github.io/board-game-networks/>`_, but you probably
want to use git directly::

  git clone https://github.com/rkdarst/board-game-networks --branch gh-pages

About
-----

All data is manually collected into a YAML format which provides some
built-in referential integrity checking, yet is still easy to modify
by hand.  Then, it is complied (with more integrity checking) into
other useful formats for downloading.  Raw data is stored in this git
repository, and processed data is put in the ``gh-pages`` branch and
published on Github Pages.

Data can be generated from the source with ``make all``.


Status
------

Under development, formats and all are unstable.  Building gh-pages is
a hack.  So far almost everything is undocumented.

License
-------

All data: CC-BY 4.0

Code: MIT

Author and collector: Richard Darst
