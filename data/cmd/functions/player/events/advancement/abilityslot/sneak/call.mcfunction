#Called as a reward from the advancment cmd:game/abilities/sneak (when player sneaks)


#PASS
scoreboard players set use.slot var 3

#EVENT CALL: ability/use
execute as @s[scores={playerstate=1}] run function cmd:player/events/ability/use/call

#REVOKE
advancement revoke @s only cmd:game/abilities/unsneak
