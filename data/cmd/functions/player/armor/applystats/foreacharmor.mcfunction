
#DECRIMENT
scoreboard players remove applystats.i var 1

#GET UPGRADE VALUE
#find upgrade value
data modify storage cmd:process/array/cycleto array set from storage cmd:templates/armor/controls statsPerUpgrade.armor
data modify storage cmd:process/array/cycleto tag.type set from storage cmd:var armor[0].type
function cmd:process/array/cycleto/run

#store value
execute store result score applystats.value var run data get storage cmd:process/array/cycleto out[0].value

#APPLY STATS
#for each stat
execute store result score applystats.j var if data storage cmd:var armor[0].stats[]
execute if score applystats.j var matches 1.. run function cmd:player/armor/applystats/foreachstat

#TRACKER PASSIVE
execute store result score applystats.passiveid var run data get storage cmd:var armor[0].passiveid
execute unless score applystats.passiveid var matches 0 run data modify storage cmd:var applystats.passives.armor prepend value {source:0, id:0}
execute unless score applystats.passiveid var matches 0 store result storage cmd:var applystats.passives.armor[0].id int 1 run scoreboard players get applystats.passiveid var
execute unless score applystats.passiveid var matches 0 run data modify storage cmd:var applystats.passives.armor[0].source set from storage cmd:var armor[0].type


#CYCLE
data modify storage cmd:var armor append from storage cmd:var armor[0]
data remove storage cmd:var armor[0]
#LOOP
execute if score applystats.i var matches 1.. run function cmd:player/armor/applystats/foreacharmor
