Ticket to Ride
==============

United States (base game)
-------------------------

My First Journey
----------------

* Simplified kids game, based in Europe


Ticket to Ride Europe
---------------------

* `Rules <https://ncdn0.daysofwonder.com/tickettoride/en/img/7202-T2RE-Rules-EN-2019.pdf>`_

* There are 110 train cards (12 per color, 14 wild (locomotives)

* ``tunnel``: edge attribute, value of zero or one.  This edge is a
  tunnel.  You must draw cards from the deck, and for any card
  matching the colors you are trying to playing, you must discard one
  extra card of that color.  There are special rules for wilds
  (locomotives) here.  So, for a regular colored play, this becomes
  about 24% ((12+14)/110) more expensive.

* ``locomotives``: edge attribute, value is number of wild
  (locomotives) needed to be played for this edge.


New York
--------

Simplified version of base game.  A node can have a point value
(``points`` node attribute), connecting to your routes gives you that
many points (the values are all one).  If you connect more than once,
you get the same bonus.

London
------

Similar version to base game.  Each node has a ``district``
attribute.  If you connect all nodes that have the same district, you
get that points equal to the district number.
