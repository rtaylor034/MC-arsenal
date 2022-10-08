
#CALL - systems/energy/regen/base

#const scores
scoreboard players set precision var 100
scoreboard players set rate var 20

#scaled baseRate
execute store result score change.add var run data get storage cmd:controls/stats energy.baseRate 1
scoreboard players operation change.add var *= precision var

#interval ratio
scoreboard players operation change.add var *= interval var
scoreboard players operation change.add var /= rate var


#rstore
execute store result score @s energy_rstore run scoreboard players operation change.add var += @s energy_rstore
scoreboard players operation @s energy_rstore %= precision var

#change
scoreboard players operation change.add var /= precision var
function cmd:player/energy/change/run

#RESETS
scoreboard players reset rate var
scoreboard players reset precision var
scoreboard players set @s energy_timer 0
