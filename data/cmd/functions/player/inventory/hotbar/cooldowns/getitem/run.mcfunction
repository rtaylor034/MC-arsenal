
#IN - (getitem.slot -> var) | ability slot
#OUT - [getitem.out -> cmd:var = Obj] | Item object

#USE - gets the physical item object in this players hotbar that represents the cooldown of the ability slot specified in (IN), and returns it in (OUT)

#SLOT KEY
#1 - Drop
#2 - Swap
#3 - Sneak
#4 - Click

data modify storage cmd:var getitem.out set value {id:"minecraft:air",Count:0b}

#RETURNS
execute if score getitem.slot var matches 1 run data modify storage cmd:var getitem.out set from entity @s Inventory[{Slot:5b}]
execute if score getitem.slot var matches 2 run data modify storage cmd:var getitem.out set from entity @s Inventory[{Slot:6b}]
execute if score getitem.slot var matches 3 run data modify storage cmd:var getitem.out set from entity @s Inventory[{Slot:7b}]
execute if score getitem.slot var matches 4 run data modify storage cmd:var getitem.out set from entity @s Inventory[{Slot:8b}]


#RESETS
scoreboard players reset getitem.in var
