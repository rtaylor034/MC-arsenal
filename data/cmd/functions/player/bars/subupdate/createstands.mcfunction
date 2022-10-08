
#CHILD FUNCTION OF player/bars/update



#make stand
summon minecraft:armor_stand ~ ~2 ~ {Invisible:1,Marker:1,Small:1,Tags:["bar","init","ownbar"],CustomNameVisible:1}
scoreboard players operation @e[type=minecraft:armor_stand,tag=init,limit=1] playerid = @s playerid
scoreboard players operation @e[type=minecraft:armor_stand,tag=init,limit=1] barstack = barupdate.barcount var
scoreboard players set @e[type=minecraft:armor_stand,tag=init,limit=1] trackcount 1

#remove init
tag @e[type=minecraft:armor_stand] remove init


#loop
scoreboard players remove barupdate.barcount var 1
execute if score barupdate.barcount var > barupdate.standcount var run function cmd:player/bars/subupdate/createstands
