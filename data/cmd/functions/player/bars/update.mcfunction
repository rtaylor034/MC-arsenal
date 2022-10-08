
#CALL - player/main | called when this player has the tag "barupdate". will not have to be manually added in normal cases, as this tag is automatically added when bars are updated using the proper methods.
#DESC - updates this players' tracker with the correct bar information stored in their array. does NOT actually display the bar.



#find tracker/bars
function cmd:player/tracker/find/run
function cmd:player/bars/find/run

execute as @e[type=marker,tag=track,limit=1] at @s run function cmd:player/bars/subupdate/trackerdata

#armor stands
execute store result score barupdate.standcount var if entity @e[type=minecraft:armor_stand,tag=ownbar]

#destroy uneeded bars
execute as @e[type=minecraft:armor_stand,tag=ownbar] if score @s barstack > barupdate.barcount var run kill @s


#create needed bars
execute if score barupdate.barcount var > barupdate.standcount var run function cmd:player/bars/subupdate/createstands

#change name
execute store result score barupdate.standcount var run tag @e[type=minecraft:armor_stand,tag=ownbar] add barupdate-name
execute as @e[type=minecraft:armor_stand,tag=barupdate-name] at @s if score @s barstack = barupdate.standcount var run function cmd:player/bars/subupdate/barname

#RESETS
function cmd:player/bars/unfind/run
function cmd:player/tracker/unfind/run
data remove storage cmd:var barupdate
tag @s remove barupdate
scoreboard players reset barupdate.barcount var
scoreboard players reset barupdate.standcount var
