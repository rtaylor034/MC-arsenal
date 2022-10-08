
#CALL - systems/abilities/base

#DECRIMENT
scoreboard players remove tracker.abilities.i var 1


#CYCLE
data modify storage cmd:var tracker.abilities append from storage cmd:var tracker.abilities[0]
data remove storage cmd:var tracker.abilities[0]



#COOLDOWN TIMER
#store and decriment
execute store result score tracker.abilities.time var run data get storage cmd:var tracker.abilities[0].time 1
scoreboard players remove tracker.abilities.time var 1
execute if score tracker.abilities.time var matches 0.. store result storage cmd:var tracker.abilities[0].time int 1 run scoreboard players get tracker.abilities.time var

#WAIT TIMER
#store and decriment
execute store result score tracker.abilities.wait var run data get storage cmd:var tracker.abilities[0].wait 1
scoreboard players remove tracker.abilities.wait var 1
execute if score tracker.abilities.wait var matches -1.. store result storage cmd:var tracker.abilities[0].wait int 1 run scoreboard players get tracker.abilities.wait var

#EVENT CALL: ability/waitcancel
execute if score tracker.abilities.wait var matches 0 as @a[tag=found] at @s run function cmd:player/events/ability/waitcancel/call

#LOOP
execute if score tracker.abilities.i var matches 1.. run function cmd:player/systems/abilities/foreachability
