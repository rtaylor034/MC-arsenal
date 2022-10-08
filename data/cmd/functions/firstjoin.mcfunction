
tellraw @s ["",{"text":"Cool Game","bold":true,"color":"green"},{"text":" by "},{"text":"GFunction","color":"blue"},{"text":" installed."}]

#PLAYER ID
scoreboard players add .max playerid 1
scoreboard players operation @s playerid = .max playerid

#TRACKER
function cmd:player/tracker/create
#/At some point, make a system to merge trackers and player id's if this player already has a tracker with a matching store UUID.
#/This would handle name changes.

tag @s add joined

#no crafting
recipe take @s *
