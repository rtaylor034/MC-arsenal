

#USES WEAPON ABILITYID
data modify storage cmd:controls/descs weapons prepend value {id:1001}
data modify storage cmd:controls/descs weapons[0].short set value ["This is a test description", "of a weapon1 that exists", "in the game that I am", "creating as of right now."]
data modify storage cmd:controls/descs weapons[0].detailed set value []

data modify storage cmd:controls/descs weapons prepend value {id:1501}
data modify storage cmd:controls/descs weapons[0].short set value ["This is a test description", "of a weapon2 that exists", "in the game that I am", "creating as of right now."]
data modify storage cmd:controls/descs weapons[0].detailed set value []
