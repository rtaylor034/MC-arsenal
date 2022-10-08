
#IN - [get.ability -> cmd:var = Ability Obj] | ability object
#IN ALT - (get.abilityid -> var) | ability id
#OUT - (get.modeldata -> var) | ability CustomModelData

#USE - Gets the CustomModelData of the ability specified by (IN).

#NOTE - based off of [abilityIcon.offset -> cmd:controls/display], just adds the offset to ability id and returns it.
#NOTE - Ability items are strictly "minecraft:leather_helmet", and this CustomModelData should be applied to that item.

#set id
execute if data storage cmd:var get.ability store result score get.abilityid var run data get storage cmd:var get.ability.id

#get control
execute store result score get.offset var run data get storage cmd:controls/display abilityIcon.offset

#out
execute store result score get.modeldata var run scoreboard players operation get.abilityid var += get.offset var


#RESETS
scoreboard players reset get.abilityid var
scoreboard players reset get.offset var
data remove storage cmd:var get.ability
