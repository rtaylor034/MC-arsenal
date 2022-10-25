


data modify storage cmd:controls/descs abilities set value []


data modify storage cmd:controls/descs abilities prepend value {id:1,uses:[]}

data modify storage cmd:controls/descs abilities[0].uses append value {primary:1,short:[],detailed:[]}
data modify storage cmd:controls/descs abilities[0].uses[-1].short set value ["Shoot a fireball that explodes on", "impact, damaging and burning nearby", "opponents."]
data modify storage cmd:controls/descs abilities[0].uses[-1].detailed set value []


data modify storage cmd:controls/descs abilities prepend value {id:2,uses:[]}

data modify storage cmd:controls/descs abilities[0].uses append value {primary:1,short:[],detailed:[]}
data modify storage cmd:controls/descs abilities[0].uses[-1].short set value ["This is a test description", "of an ability2 use1 that", "exists in the game that I", "am creating as of right now."]
data modify storage cmd:controls/descs abilities[0].uses[-1].detailed set value []

data modify storage cmd:controls/descs abilities[0].uses append value {short:[],detailed:[]}
data modify storage cmd:controls/descs abilities[0].uses[-1].short set value ["This is a test description", "of an ability2 use2 that", "exists in the game that I", "am creating as of right now."]
data modify storage cmd:controls/descs abilities[0].uses[-1].detailed set value []
