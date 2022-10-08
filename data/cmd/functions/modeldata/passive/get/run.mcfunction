
#IN - [get.passive -> cmd:var = Passive Obj] | passive object
#IN - A (get.passiveid -> var) | passive id
#OUT - A (get.modeldata -> var) | icon CustomModelData

#USE - Gets the CustomModelData and color for the icon of the passive specified in (IN).

#NOTE - based off of [passiveIcon.offset -> cmd:controls/display], just adds the offset to stat id and returns it.
#NOTE - passive icon items are strictly "minecraft:purple_dye", and this CustomModelData should be applied to that item.


#set id
execute if data storage cmd:var get.passive store result score get.passiveid var run data get storage cmd:var get.passive.id

#get control
execute store result score get.offset var run data get storage cmd:controls/display passiveIcon.offset

#out
execute store result score get.modeldata var run scoreboard players operation get.passiveid var += get.offset var


#RESETS
scoreboard players reset get.passiveid var
scoreboard players reset get.offset var
data remove storage cmd:var get.passive
