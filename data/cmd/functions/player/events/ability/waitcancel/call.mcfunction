#CALL - from systems/abilities/foreachability

#PASS - A [tracker.abilities[0] -> cmd:var ; Ability Obj] | ability object
#PASSTYPE - (read, set)]
#CONTEXT - this player

#DESC - Called when an ability is wait cancelled, (wait timer hits 0).

#NOTE - [PASS A] will have its data transferred to this players tracker automatically.

#COOLDOWN
#get waitcancel
data modify storage cmd:process/array/cycleto array set from storage cmd:var tracker.abilities[0].uses
data modify storage cmd:process/array/cycleto tag.waitCancel set value 1
function cmd:process/array/cycleto/run
#cooldown (-1 for non jitter update)
execute store result score waitcancel.cooldown var run data get storage cmd:process/array/cycleto out[0].cooldown
scoreboard players remove waitcancel.cooldown var 1
execute store result storage cmd:var tracker.abilities[0].time int 1 run scoreboard players get waitcancel.cooldown var

#CYCLE TO PRIMARY
data modify storage cmd:process/array/cycleto array set from storage cmd:var tracker.abilities[0].uses
data modify storage cmd:process/array/cycleto tag.primary set value 1
function cmd:process/array/cycleto/run
#set
data modify storage cmd:var tracker.abilities[0].uses set from storage cmd:process/array/cycleto out

#vfx
tellraw @s {"text":"wait cancelled","color":"dark_gray"}

#SOUND
playsound minecraft:block.fire.extinguish master @s ~ ~ ~ 0.7 1.888

#RESETS
scoreboard players reset waitcancel.cooldown var
