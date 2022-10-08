
#CALL - events/action/drop/call
#DESC - Called when the player drops their weapon (has slot 0 selected), successfully casting the ability



#RE EQUIP
#function cmd:player/armor/equip/weapon

#PASS
scoreboard players set use.slot var 1

#EVENT CALL: ability/use
execute as @s[scores={playerstate=1}] run function cmd:player/events/ability/use/call
