
#CALL - playerstates/ingame/alive
#Called from this players tracker

#find player
scoreboard players operation findplayer.id var = @s playerid
execute as @a if score @s playerid = findplayer.id var run tag @s add found

#EFFECTS
function cmd:player/systems/effects/base

#ABILITIES
function cmd:player/systems/abilities/base

#RESETS
scoreboard players reset findplayer.id var
tag @a remove found
