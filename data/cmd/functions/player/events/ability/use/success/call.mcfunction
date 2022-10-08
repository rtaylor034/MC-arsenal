
#CALL - from events/ability/use/call
#FROM - this player
#PASS - [abilities -> cmd:var = Array[Obj] ] | cycled array of ability objects (abilities[0] is the ability used)
#PASSTYPE - (read)
#DESC - Called when this player uses an ability and it is available (not on cooldown).

#NOTE - this players tracker already has the tag "track"

#TYPE KEY
#1 - Attack
#2 - Movement
#3 - Utility
#4 - Defense
#5 - Weapon

#SLOT KEY
#1 - Drop
#2 - Swap
#3 - Sneak
#4 - Weapon Click



tellraw @a ["",{"selector":"@s"},{"text":" just used ","color":"gray"},{"nbt":"abilities[0].name","storage":"cmd:var","color":"yellow"},{"text":" | id:","color":"red"},{"nbt":"abilities[0].id","storage":"cmd:var","color":"gold"}]


#SOUND
playsound minecraft:item.trident.throw master @s ~ ~ ~ 0.5 2



#MODIFY ABILITY ARRAY ON TRACKER
function cmd:player/events/ability/use/success/trackerdata
