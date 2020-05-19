Arkham horror
=============

This game has a network one may move on, but it is fairly well
connected to the point that network analysis is not an extremely
interesting part of this game.

This network is from the second edition.  The third edition has a
adjustable board layout.  The first edition has linear streets that form
a graph-like object, but streets are segmented into discrete segments,
and you can be located on any segment.

Node attributes:

* ``region=TEXT``: The region of the game.  The region streets have
  the same name in ``region`` as the node label.

* ``order=N``: integer order representing the loop that monsters take
  around the core regions of the city.  White arrows go in ascending
  order, black arrows go in descending order.  Nodes without an
  ``order`` are leaf nodes which have only one connection, going to
  their respective street areas.

* ``stable=N``: If ``0``, this is an unstable location (initial clue /
  monsters start here).  If ``1``, the location is stable.
