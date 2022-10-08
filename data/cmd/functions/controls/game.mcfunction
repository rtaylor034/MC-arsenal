
#DESC - designated for all controls regarding game logic or gamestate




#5v5

data modify storage cmd:controls/game 5v5.phases set value {prepare:{time:90},fight:{time:300}}

data modify storage cmd:controls/game 5v5.roundWinsRequired set value 5
