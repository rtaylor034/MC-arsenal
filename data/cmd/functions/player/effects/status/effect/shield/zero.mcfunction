
#Runs from the player when this effects timer reaches 0, or when it is about to end.



#get amount
execute store result score effect.shield var run data get storage cmd:var e.params.amount

#SHIELD REMOVE
scoreboard players operation @s shield -= effect.shield var
execute if score @s shield matches ..-1 run scoreboard players set @s shield 0


#updates
tag @s add attupdate

#healthbar update
function cmd:player/bars/health/update/run


#RESET
scoreboard players reset effect.shield
