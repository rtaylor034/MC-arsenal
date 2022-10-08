
#Called on all players with the tag "attupdate"

#ADD THE TAG "attupdate" TO A PLAYER WHENEVER THE VALUES BELOW CAN CHANGE
# (@s -> health)
# (@s -> shield)
# (@s -> stat_mspeed)
# (@s -> weap_aspeed)

#SET TEMPLATE BASE
data modify storage cmd:var attributes set value []

#HEALTH
function cmd:player/attributes/health/set

#SHIELD
function cmd:player/attributes/shield/set

#MOVEMENT SPEED
function cmd:player/attributes/speed/set

#ATTACK SPEED [DEPRICATED]
##function cmd:player/attributes/attackspeed/set


#ATTRIBUTE UPDATE
#goes to chest slot
item modify entity @s armor.chest cmd:attributes/apply
stopsound @s * minecraft:item.armor.equip_leather


#RESETS
data remove storage cmd:var attributes
tag @s remove attupdate
