Afrikan Tähti (Star of Africa)
==============================

This is a relatively complex multiplex network.  It is recommended to
read `the rules (Wikipedia)
<https://en.wikipedia.org/wiki/Afrikan_t%C3%A4hti>`_ to understand how
things work in this game, because the different edge types must be
considered, or else the graph distances do not make sense.

There are four types of nodes:

* ``type=city``: normal, has an taken to take
* ``type=junction``: no in-game role, but serves to make junctions
  without there being some other sort of city there.
* ``type=initial``: a starting city (Tangier and Cairo)
* ``type=ambush``: You get ambushed or attacked by pirates.  Three
  places, before/after St. Helena and by Sahara.  One must wait there
  until one roles a 1-2 on a 6-sided die.

There are three types of links:

* For both ``land`` and ``sea``, weight equals edge length.  However,
  all movement is in units of one.  Thus, if there is a weight=6 edge
  between cities A (initial) and B (target), and if you roll a die and
  get 2, then you are distance=2 from a and distance=4 from B.  For a
  proper simulation, this must be considered.  For a more complete
  description, see the rules summary in the `Wikipedia article
  <https://en.wikipedia.org/wiki/Afrikan_t%C3%A4hti>`_.
* ``type=land``: Free to move, movement as described above.
* ``type=air``: Costs 300c to fly (c=currency unit).  You immediately
  end in the connected city.  All of these edges have a ``weight=1``,
  even though there is a significant currency cost.
* ``type=sea``.  Movement similar to land.  However, you must pay 100c
  on the first step leaving a city to enter this edge.

Thus, you could consider that sea and land edges of weight *w* are
split into *w* separate segments.

There are three fundamental types of edges: land, sea, and air, each
of which has a different time and currency cost.  Thus, naive distance
measures don't just work: these different money/distance costs must be
considered to make different routes with different trade-offs.
