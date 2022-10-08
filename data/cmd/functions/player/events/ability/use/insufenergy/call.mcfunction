
#CALL - from events/ability/use/call
#FROM - this player
#PASS - A [abilities -> cmd:var = Array[Obj] ], B (ability.success -> var)| cycled array of ability objects (abilities[0] is the ability used), will ability be used?
#PASSTYPE - A (read), B (set)
#DESC - Called when player tries to use an ability but they do not have enough energy

#NOTE - this players tracker already has the tag "track"
#NOTE - (PASS B) should be set to 0 by default, as it regulates if the ability should be actually used.



tellraw @s {"text":"not enough energy","color":"red"}


#PASS
scoreboard players set ability.success var 0

#SOUND
playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.5
