
#CALL - from events/ability/use/call
#FROM - this player
#PASS - A [abilities -> cmd:var = Array[Obj] ], B (ability.success -> var)| cycled array of ability objects (abilities[0] is the ability used), will ability be used?
#PASSTYPE - A (read), B (set)
#DESC - Called when player tries to use an ability but it is on cooldown

#NOTE - this players tracker already has the tag "track"
#NOTE - (PASS B) should be set to 0 by default, as it regulates if the ability should be actually used.
#NOTE - this will be called BEFORE insufenergy, and insufenergy will not be called if (PASS B) is set to 0.


tellraw @s {"text":"ability on cooldown","color":"red"}


#PASS
scoreboard players set ability.success var 0

#SOUND
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
