
#Called as a reward from the advancment cmd:game/meleedeal (this player hits another with a Weapon inhand)


#PASS VARS
#source
scoreboard players operation melee.source var = @s playerid
scoreboard players operation melee.target var = @p[advancements={cmd:game/meleetake=true}] playerid

#EVENT CALL: melee/deal
function cmd:player/events/melee/deal/call

#EVENT CALL: melee/take
execute as @p[advancements={cmd:game/meleetake=true}] at @s run function cmd:player/events/melee/take/call

#RESETS
advancement revoke @s only cmd:game/meleedeal
advancement revoke @a only cmd:game/meleetake
scoreboard players reset melee.source var
scoreboard players reset melee.target var
