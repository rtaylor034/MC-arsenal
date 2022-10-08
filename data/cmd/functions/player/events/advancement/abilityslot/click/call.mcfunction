
#CALL - events/action/rodclick/call
#DESC - Called when this player clicks on their weapon

#PASS
scoreboard players set use.slot var 4

#EVENT CALL: ability/use
execute as @s[scores={playerstate=1}] run function cmd:player/events/ability/use/call
