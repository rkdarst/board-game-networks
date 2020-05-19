Concordia
=========

The base game comes with two boards, it seems: *Imperium* (centered
around the Mediterranean sea, 3-5 players) and Italia (Italy, 2-4 players).

I don't currently know much about how this game works, but you start
in Roma and expand out training.

This is a multigraph.  Pawns start in the starting city (Roma), but
after that, they move on edges only.  Thus, the pawns move on the line
graph of the given graphs here.  There are two types of pawns: those
that move on the sea edges, and those that move on the land edges.

Node attributes:

* ``region``: regions contain 2-3 cities.
* ``letter``: a letter above each city, seems somewhat correlated with
  the region.  Roma has no letter (``""``), and in Italia has no
  region, because it is the special starting city.

Edge attributes:

* ``type``: ``sea`` or ``land`` route.
