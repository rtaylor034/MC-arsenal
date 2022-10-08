
#IN - @s, A1 (change.set -> var), A2 (change.add -> var) | value to set, value to add
#OUT - (change.out -> var), | energy level after change

#USE - Standard process to call for changing the energy level of a player.

#NOTE - Call this process from the player recieving energy
#NOTE - This process should be used for *ANY AND ALL* energy changes unless it is a VERY special and controlled case. This is because this process deals with the xp bar calculation.
#NOTE - input (IN A1) OR (IN A2), no need to set both. (IN A1) sets the players energy to a value, while (IN A2) adds to the players existing energy value.


#ENERGY SCORE CALCULATION
execute if score change.set var matches -1000.. run scoreboard players operation @s energy = change.set var
execute if score change.add var matches -1000.. run scoreboard players operation @s energy += change.add var

#clamp to 0 and max energy
execute if score @s energy > @s max_energy run scoreboard players operation @s energy = @s max_energy
execute if score @s energy matches ..-1 run scoreboard players set @s energy 0


#XP CALCULATION

#ratio convertion (energy/max_energy to x/101)
scoreboard players operation xptarget var = @s energy
scoreboard players set xpmax var 101
scoreboard players operation xptarget var *= xpmax var
scoreboard players operation xptarget var /= @s max_energy

#base level (sets max xp points to 101)
xp set @s 28 levels
xp set @s 0 points

#points - addition and difference calc (uses 6 bit binary count - up to 127)
execute if score xptarget var matches 64.. run xp add @s 64 points
execute if score xptarget var matches 64.. run scoreboard players remove xptarget var 64
execute if score xptarget var matches 32.. run xp add @s 32 points
execute if score xptarget var matches 32.. run scoreboard players remove xptarget var 32
execute if score xptarget var matches 16.. run xp add @s 16 points
execute if score xptarget var matches 16.. run scoreboard players remove xptarget var 16
execute if score xptarget var matches 8.. run xp add @s 8 points
execute if score xptarget var matches 8.. run scoreboard players remove xptarget var 8
execute if score xptarget var matches 4.. run xp add @s 4 points
execute if score xptarget var matches 4.. run scoreboard players remove xptarget var 4
execute if score xptarget var matches 2.. run xp add @s 2 points
execute if score xptarget var matches 2.. run scoreboard players remove xptarget var 2
execute if score xptarget var matches 1.. run xp add @s 1 points
execute if score xptarget var matches 1.. run scoreboard players remove xptarget var 1

#levels - addition and difference calc (uses 8 bit binary count - up to 511)
xp set @s 0 levels
scoreboard players operation xptarget var = @s energy
execute if score xptarget var matches 256.. run xp add @s 256 levels
execute if score xptarget var matches 256.. run scoreboard players remove xptarget var 256
execute if score xptarget var matches 128.. run xp add @s 128 levels
execute if score xptarget var matches 128.. run scoreboard players remove xptarget var 128
execute if score xptarget var matches 64.. run xp add @s 64 levels
execute if score xptarget var matches 64.. run scoreboard players remove xptarget var 64
execute if score xptarget var matches 32.. run xp add @s 32 levels
execute if score xptarget var matches 32.. run scoreboard players remove xptarget var 32
execute if score xptarget var matches 16.. run xp add @s 16 levels
execute if score xptarget var matches 16.. run scoreboard players remove xptarget var 16
execute if score xptarget var matches 8.. run xp add @s 8 levels
execute if score xptarget var matches 8.. run scoreboard players remove xptarget var 8
execute if score xptarget var matches 4.. run xp add @s 4 levels
execute if score xptarget var matches 4.. run scoreboard players remove xptarget var 4
execute if score xptarget var matches 2.. run xp add @s 2 levels
execute if score xptarget var matches 2.. run scoreboard players remove xptarget var 2
execute if score xptarget var matches 1.. run xp add @s 1 levels
execute if score xptarget var matches 1.. run scoreboard players remove xptarget var 1

#OUT
scoreboard players operation change.out var = @s energy

#STOPSOUND
stopsound @s * minecraft:entity.player.levelup


#RESETS
scoreboard players reset xptarget var
scoreboard players reset xpmax var
scoreboard players reset change.set var
scoreboard players reset change.add var
