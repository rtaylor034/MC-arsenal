
#IN - @s, (unequip.slot -> var) | slot id
#IN ALT - (unequip.id -> var) | ability id
#OUT - A (unequip.success -> var), B [unequip.out -> cmd:var = Ability Obj] | success?, ability object

#USE - unequips the ability in slot (IN) on this players tracker. (OUT A) returns 1 if there is an ability in this slot, 0 otherwise. (OUT B) returns the ability object that was unequipped.
#USE ALT - unequips the ability with the id specified by (IN) on this players tracker if they have it. (OUT B) returns 1 if an ability is found, 0 otherwise. (OUT B) returns the ability object that was unequipped.

#NOTE - make sure (IN) matches a valid slot, if not, it may cause problems.

#FIND TRACKER
function cmd:player/tracker/find/run

#tracker data get
data modify storage cmd:var unequip.slots set from entity @e[type=minecraft:marker,tag=track,limit=1] data.abilities

#remove
execute if score unequip.slot var matches 0.. run function cmd:player/abilities/unequip/slot
execute if score unequip.id var matches -999.. run function cmd:player/abilities/unequip/id

#tracker data set
data modify entity @e[type=minecraft:marker,tag=track,limit=1] data.abilities set from storage cmd:var unequip.slots

#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var unequip.slots
scoreboard players reset unequip.slot var
scoreboard players reset unequip.id var
