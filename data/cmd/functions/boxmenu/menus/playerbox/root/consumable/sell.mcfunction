
#DESC - sell this consumable

#UNEQUIP
execute store result score unequip.slot var run data get storage cmd:var selection.menu.tags.slot
execute as @a[tag=boxmenu-owner] at @s run function cmd:player/consumables/unequip/run



#VFX
execute as @a[tag=boxmenu-owner] at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 0.5 0.944



#ADD CURRENCY
execute store result score give.amount var run data get storage cmd:var selection.menu.tags.cost
execute as @a[tag=boxmenu-owner] at @s run function cmd:player/currency/c/give/run
