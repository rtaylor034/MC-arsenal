#called from @a
#CALL - playerstates/ingame/alive

scoreboard players add @s energy_timer 1
execute store result score interval var run data get storage cmd:controls/stats energy.interval 1

execute if score @s energy < @s max_energy if score @s energy_timer >= interval var run function cmd:player/systems/energy/regen/gain

execute if score @s energy_timer >= interval var run scoreboard players set @s energy_timer 0





#RESETS
scoreboard players reset interval var
