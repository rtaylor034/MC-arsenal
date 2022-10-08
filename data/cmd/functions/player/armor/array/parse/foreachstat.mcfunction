
#called from foreacharmor

#DECRIMENT
scoreboard players remove parse.f var 1

#STORE
#cycle in statstore
data modify storage cmd:process/array/cycleto array set from storage cmd:var statstore
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var a.stats[0]
execute if data storage cmd:var a.stats[0] run function cmd:process/array/cycleto/run
data modify storage cmd:var statstore set from storage cmd:process/array/cycleto out

#add 1 to "count" in correct statstore element
scoreboard players set parse.statcount 0
execute store result score parse.statcount var run data get storage cmd:var statstore[0].count
execute unless data storage cmd:var statstore[0].count run data modify storage cmd:var statstore[0].count set value 0
execute store result storage cmd:var statstore[0].count int 1 run scoreboard players add parse.statcount var 1

#COLOR
#store
execute store result score parse.color var run data get storage cmd:var a.itemtag.display.color

#cycle
data modify storage cmd:process/array/cycleto array set from storage cmd:templates/armor/parse stats
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var a.stats[0]
function cmd:process/array/cycleto/run

#RGB TO DECIMAL
data modify storage cmd:process/math/rgbtodecimal in set from storage cmd:process/array/cycleto out[0].color
function cmd:process/math/rgbtodecimal/run

execute store result storage cmd:var a.itemtag.display.color int 1 run scoreboard players operation parse.color var += rgbtodecimal.out var


#CYCLE
data modify storage cmd:var a.stats append from storage cmd:var a.stats[0]
data remove storage cmd:var a.stats[0]
#LOOP
execute if score parse.f var matches 1.. run function cmd:player/armor/array/parse/foreachstat
