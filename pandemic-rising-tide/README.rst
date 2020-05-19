Pandemic: Rising tide
=====================

* Publisher: Z-man games
* `BGG link
  <https://www.boardgamegeek.com/boardgame/234671/pandemic-rising-tide>`_
* `Board image <https://www.espritjeu.com/upload/image/pandemic---montee-des-eaux-p-image-63790-grande.jpg>`_
* `Rules <https://images.zmangames.com/filer_public/ef/d4/efd42a51-2537-4dba-8439-e4d8c7f72f04/rising_tide_rules.pdf>`_

Network notes:

* There are four main colors (node labels): ``purple``, ``yellow``,
  ``orange``, ``green``.  But this two other values for this: ``sea``
  (it is a sea) and ``high`` (this is high elevation and can not be
  flooded).  Dikes can not be made between high elevation land and
  other land (though they aren't needed there).  Edges between high
  elevation land and other land are not specially tagged, you need to
  check adjacent nodes to handle these correctly

  * People can move onto any node except ``sea``.

  * Water can not flow on ``high`` areas.

* Noordzee and Zuiderzee (the seas) are two different network nodes.
  The edge between them starts out with weight zero.  These become
  separated once the Afsluitdijk hydraulic structure is made, and this
  edge weight should become one.

  The graph distance algorithms need to remove these nodes, because a
  player can not walk through them.

  * Zuiderzee becomes a walkable location once Afsluitdijk is created.

  * The initial edge weight between Nordzee and Zuiderzee is zero,
    because they are connected.

* The edge attribute ``initial`` is the number of dikes that start off
  between each area.  Two edges start off with two dikes.  It seems
  that, according to the rules, there is no limit to the number of
  dikes that can be constructed between any two regions.
