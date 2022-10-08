
#adds this playerboxes team to the abilities storage array

data modify storage cmd:storage/playerboxes abilities prepend value {team:0, array:[]}
execute store result storage cmd:storage/playerboxes abilities[0].team int 1 run scoreboard players get @s team
data modify storage cmd:storage/playerboxes abilities[0].array set from storage cmd:controls/abilities array
#first ability marker (for keeping the same order)
data modify storage cmd:storage/playerboxes abilities[0].array[0].first set value 1
