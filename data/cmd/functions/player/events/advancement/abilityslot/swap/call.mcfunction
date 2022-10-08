#Called as a reward from the advancment cmd:game/abilities/swap (this player has any item in offhand)


#PASS
scoreboard players set use.slot var 2

#EVENT CALL: ability/use
execute as @s[scores={playerstate=1}] run function cmd:player/events/ability/use/call


#RESET SLOT
item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand with air

#REVOKE
advancement revoke @s only cmd:game/abilities/swap
