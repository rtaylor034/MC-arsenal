
#IN - (getitem.slot -> var) | consumable slot
#OUT - [getitem.out -> cmd:var = Obj] | Item object

#USE - gets the physical item object in this players hotbar that represents the consumable slot specified in (IN), and returns it in (OUT)

#SLOT KEY

data modify storage cmd:var getitem.out set value {id:"minecraft:air",Count:0b}

#RETURNS
execute if score getitem.slot var matches 1 run data modify storage cmd:var getitem.out set from entity @s Inventory[{Slot:1b}]
execute if score getitem.slot var matches 2 run data modify storage cmd:var getitem.out set from entity @s Inventory[{Slot:2b}]
execute if score getitem.slot var matches 3 run data modify storage cmd:var getitem.out set from entity @s Inventory[{Slot:3b}]
execute if score getitem.slot var matches 4 run data modify storage cmd:var getitem.out set from entity @s Inventory[{Slot:4b}]


#RESETS
scoreboard players reset getitem.in var
