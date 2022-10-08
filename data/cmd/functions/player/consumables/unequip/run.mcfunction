
#IN - @s, (unequip.slot -> var) | slot id
#IN ALT - (unequip.id -> var) | consumable id
#OUT - A (unequip.success -> var), B [unequip.out -> cmd:var = Ability Obj] | success?, consumable object
#USE - unequips the consumable in slot (IN) on this players tracker. (OUT B) returns 1 if there is an consumable in this slot, 0 otherwise.
#USE ALT - unequips the consumable with the id specified by (IN) on this players tracker if they have it. (OUT B) returns 1 if an consumable is found, 0 otherwise.

#NOTE - make sure (IN) matches a valid slot, if not, it may cause problems.

#FIND TRACKER
function cmd:player/tracker/find/run

#tracker data get
data modify storage cmd:var unequip.slots set from entity @e[type=minecraft:marker,tag=track,limit=1] data.consumables

#remove
execute if score unequip.slot var matches 0.. run function cmd:player/consumables/unequip/slot
execute if score unequip.id var matches -999.. run function cmd:player/consumables/unequip/id

#tracker data set
data modify entity @e[type=minecraft:marker,tag=track,limit=1] data.consumables set from storage cmd:var unequip.slots

#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var unequip.slots
scoreboard players reset unequip.slot var
scoreboard players reset unequip.id var
