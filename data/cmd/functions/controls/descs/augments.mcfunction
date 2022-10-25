


data modify storage cmd:controls/descs augments set value []


data modify storage cmd:controls/descs augments prepend value {id:1}
data modify storage cmd:controls/descs augments[0].short set value ["This is a test description", "of an augment1 that exists", "in the game that I am", "creating as of right now."]
data modify storage cmd:controls/descs augments[0].detailed set value []

data modify storage cmd:controls/descs augments prepend value {id:2}
data modify storage cmd:controls/descs augments[0].short set value ["This is a test description", "of an augment2 that exists", "in the game that I am", "creating as of right now."]
data modify storage cmd:controls/descs augments[0].detailed set value []
