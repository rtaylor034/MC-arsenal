
#Runs when the player initially is inflicted with this effect

#get amount param
execute store result score effect.shield var run data get storage cmd:var e.params.amount

#SHIELD ADD
scoreboard players operation @s shield += effect.shield var

#updates
tag @s add attupdate

#health bar update
function cmd:player/bars/health/update/run

#RESET
scoreboard players reset effect.shield
