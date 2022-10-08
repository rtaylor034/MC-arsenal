


#get control
execute store result score get.offset var run data get storage cmd:controls/display statIcon.weapon.offset

#COLOR
#cycle
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/armor statIdentities.weapon
execute store result storage cmd:process/array/cycleto tag.id int 1 run scoreboard players get get.statid var
function cmd:process/array/cycleto/run
#convert
data modify storage cmd:process/math/rgbtodecimal in set from storage cmd:process/array/cycleto out[0].color
function cmd:process/math/rgbtodecimal/run

#multiply
scoreboard players set get.mult var 4
execute store result score get.color var run scoreboard players operation rgbtodecimal.out var *= get.mult var

#add base color
data modify storage cmd:process/math/rgbtodecimal in set from storage cmd:controls/armor defaultColor
function cmd:process/math/rgbtodecimal/run
scoreboard players operation get.color var += rgbtodecimal.out var


#out
execute store result score get.modeldata var run scoreboard players operation get.statid var += get.offset var
