graph [
  multigraph 1
  filename "data/afrikan-tahti/afrikan-tahti.yaml"
  node [
    id 0
    label "Canary Islands"
    type "city"
  ]
  node [
    id 1
    label "Morocco"
    type "city"
  ]
  node [
    id 2
    label "Junction Tangier-Morocco"
    type "junction"
  ]
  node [
    id 3
    label "Tangier"
    type "initial"
  ]
  node [
    id 4
    label "Sahara"
    type "city"
  ]
  node [
    id 5
    label "Ambush - Saraha"
    type "ambush"
  ]
  node [
    id 6
    label "Tunis"
    type "city"
  ]
  node [
    id 7
    label "Tripoli"
    type "city"
  ]
  node [
    id 8
    label "Junction - Tripoli"
    type "junction"
  ]
  node [
    id 9
    label "Egypt"
    type "city"
  ]
  node [
    id 10
    label "Cairo"
    type "initial"
  ]
  node [
    id 11
    label "Cape Verde"
    type "city"
  ]
  node [
    id 12
    label "Junction Cape Verde-Sierra Leone"
    type "junction"
  ]
  node [
    id 13
    label "Sierra Leone"
    type "city"
  ]
  node [
    id 14
    label "Junction Sierra Leone-Timbuktu"
    type "junction"
  ]
  node [
    id 15
    label "Timbuktu"
    type "city"
  ]
  node [
    id 16
    label "Gold Coast"
    type "city"
  ]
  node [
    id 17
    label "Junction Slave Coast-Congo"
    type "junction"
  ]
  node [
    id 18
    label "Slave Coast"
    type "city"
  ]
  node [
    id 19
    label "Junction Slave Coast-Darfur"
    type "junction"
  ]
  node [
    id 20
    label "Ain-Galaka"
    type "city"
  ]
  node [
    id 21
    label "Darfur"
    type "city"
  ]
  node [
    id 22
    label "Suakin"
    type "city"
  ]
  node [
    id 23
    label "Congo"
    type "city"
  ]
  node [
    id 24
    label "Kandjama"
    type "city"
  ]
  node [
    id 25
    label "Ocomba"
    type "city"
  ]
  node [
    id 26
    label "Bahar el Ghasal"
    type "city"
  ]
  node [
    id 27
    label "Lake Victoria"
    type "city"
  ]
  node [
    id 28
    label "Daressalam"
    type "city"
  ]
  node [
    id 29
    label "Junction Daressalam-Mozambique"
    type "junction"
  ]
  node [
    id 30
    label "Addis Abeba"
    type "city"
  ]
  node [
    id 31
    label "Cape Guadafui"
    type "city"
  ]
  node [
    id 32
    label "Pirate - St. Helena West"
    type "ambush"
  ]
  node [
    id 33
    label "St. Helena"
    type "city"
  ]
  node [
    id 34
    label "Pirate - St. Helena East"
    type "ambush"
  ]
  node [
    id 35
    label "Whalefish Bay"
    type "city"
  ]
  node [
    id 36
    label "Junction - Whalefish Bay-Capetown"
    type "junction"
  ]
  node [
    id 37
    label "Capetown"
    type "city"
  ]
  node [
    id 38
    label "Victoria Falls"
    type "city"
  ]
  node [
    id 39
    label "Dragon Mountain"
    type "city"
  ]
  node [
    id 40
    label "Junction - Dragon Mountain"
    type "junction"
  ]
  node [
    id 41
    label "Junction - Mozambique"
    type "junction"
  ]
  node [
    id 42
    label "Mozambique"
    type "city"
  ]
  node [
    id 43
    label "Cape St. Marie"
    type "city"
  ]
  node [
    id 44
    label "Tamatave"
    type "city"
  ]
  edge [
    source 0
    target 3
    key 0
    type "sea"
    weight 3
  ]
  edge [
    source 0
    target 11
    key 0
    type "sea"
    weight 5
  ]
  edge [
    source 1
    target 3
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 1
    target 2
    key 0
    type "land"
    weight 1
  ]
  edge [
    source 1
    target 11
    key 0
    type "land"
    weight 8
  ]
  edge [
    source 1
    target 16
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 1
    target 13
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 2
    target 3
    key 0
    type "land"
    weight 1
  ]
  edge [
    source 2
    target 4
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 3
    target 6
    key 0
    type "sea"
    weight 3
  ]
  edge [
    source 3
    target 6
    key 1
    type "land"
    weight 5
  ]
  edge [
    source 3
    target 7
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 4
    target 5
    key 0
    type "land"
    weight 2
  ]
  edge [
    source 5
    target 21
    key 0
    type "land"
    weight 8
  ]
  edge [
    source 6
    target 8
    key 0
    type "sea"
    weight 2
  ]
  edge [
    source 6
    target 7
    key 0
    type "land"
    weight 3
  ]
  edge [
    source 7
    target 8
    key 0
    type "sea"
    weight 1
  ]
  edge [
    source 7
    target 21
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 7
    target 9
    key 0
    type "land"
    weight 6
  ]
  edge [
    source 7
    target 16
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 8
    target 10
    key 0
    type "sea"
    weight 3
  ]
  edge [
    source 9
    target 10
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 9
    target 21
    key 0
    type "land"
    weight 3
  ]
  edge [
    source 10
    target 22
    key 0
    type "sea"
    weight 4
  ]
  edge [
    source 10
    target 22
    key 1
    type "air"
    weight 1
  ]
  edge [
    source 11
    target 13
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 11
    target 12
    key 0
    type "sea"
    weight 1
  ]
  edge [
    source 12
    target 13
    key 0
    type "sea"
    weight 2
  ]
  edge [
    source 12
    target 32
    key 0
    type "sea"
    weight 8
  ]
  edge [
    source 13
    target 14
    key 0
    type "land"
    weight 3
  ]
  edge [
    source 13
    target 16
    key 0
    type "sea"
    weight 5
  ]
  edge [
    source 13
    target 33
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 14
    target 15
    key 0
    type "land"
    weight 2
  ]
  edge [
    source 14
    target 16
    key 0
    type "land"
    weight 2
  ]
  edge [
    source 15
    target 18
    key 0
    type "land"
    weight 5
  ]
  edge [
    source 16
    target 23
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 16
    target 17
    key 0
    type "sea"
    weight 3
  ]
  edge [
    source 16
    target 35
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 17
    target 18
    key 0
    type "sea"
    weight 1
  ]
  edge [
    source 17
    target 23
    key 0
    type "sea"
    weight 4
  ]
  edge [
    source 18
    target 19
    key 0
    type "land"
    weight 3
  ]
  edge [
    source 19
    target 20
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 19
    target 21
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 19
    target 24
    key 0
    type "land"
    weight 2
  ]
  edge [
    source 20
    target 21
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 21
    target 22
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 21
    target 22
    key 1
    type "land"
    weight 4
  ]
  edge [
    source 21
    target 26
    key 0
    type "land"
    weight 2
  ]
  edge [
    source 21
    target 25
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 22
    target 31
    key 0
    type "sea"
    weight 5
  ]
  edge [
    source 22
    target 30
    key 0
    type "land"
    weight 3
  ]
  edge [
    source 22
    target 27
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 23
    target 24
    key 0
    type "land"
    weight 3
  ]
  edge [
    source 23
    target 25
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 23
    target 41
    key 0
    type "land"
    weight 8
  ]
  edge [
    source 23
    target 35
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 23
    target 35
    key 1
    type "sea"
    weight 5
  ]
  edge [
    source 25
    target 27
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 25
    target 37
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 26
    target 27
    key 0
    type "land"
    weight 2
  ]
  edge [
    source 27
    target 30
    key 0
    type "land"
    weight 3
  ]
  edge [
    source 27
    target 31
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 27
    target 29
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 27
    target 39
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 28
    target 31
    key 0
    type "land"
    weight 6
  ]
  edge [
    source 28
    target 29
    key 0
    type "land"
    weight 1
  ]
  edge [
    source 29
    target 42
    key 0
    type "land"
    weight 2
  ]
  edge [
    source 30
    target 31
    key 0
    type "land"
    weight 3
  ]
  edge [
    source 31
    target 44
    key 0
    type "sea"
    weight 8
  ]
  edge [
    source 31
    target 44
    key 1
    type "air"
    weight 1
  ]
  edge [
    source 31
    target 42
    key 0
    type "sea"
    weight 8
  ]
  edge [
    source 32
    target 33
    key 0
    type "sea"
    weight 1
  ]
  edge [
    source 33
    target 37
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 33
    target 34
    key 0
    type "sea"
    weight 1
  ]
  edge [
    source 34
    target 36
    key 0
    type "sea"
    weight 7
  ]
  edge [
    source 35
    target 38
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 35
    target 37
    key 0
    type "land"
    weight 4
  ]
  edge [
    source 35
    target 37
    key 1
    type "air"
    weight 1
  ]
  edge [
    source 35
    target 36
    key 0
    type "sea"
    weight 3
  ]
  edge [
    source 36
    target 37
    key 0
    type "sea"
    weight 2
  ]
  edge [
    source 37
    target 39
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 37
    target 44
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 37
    target 43
    key 0
    type "air"
    weight 1
  ]
  edge [
    source 37
    target 43
    key 1
    type "sea"
    weight 8
  ]
  edge [
    source 38
    target 40
    key 0
    type "land"
    weight 2
  ]
  edge [
    source 38
    target 39
    key 0
    type "land"
    weight 3
  ]
  edge [
    source 39
    target 40
    key 0
    type "land"
    weight 2
  ]
  edge [
    source 40
    target 41
    key 0
    type "land"
    weight 1
  ]
  edge [
    source 41
    target 42
    key 0
    type "land"
    weight 2
  ]
  edge [
    source 42
    target 43
    key 0
    type "sea"
    weight 3
  ]
  edge [
    source 43
    target 44
    key 0
    type "land"
    weight 4
  ]
]