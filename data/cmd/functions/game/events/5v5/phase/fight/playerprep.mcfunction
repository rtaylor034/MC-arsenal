

#/right now its fine to just tp. later have "gates" open or something, so players are tped and given a short period to just sit in base.
#tp
execute as @s at @s run function cmd:game/landmarks/basespawns/playertp/run

#playerstate
scoreboard players set @s playerstate 1
gamemode adventure @s

#health set
scoreboard players operation @s health = @s max_health

#apply stats
function cmd:player/armor/applystats/run

#equip
function cmd:player/armor/equip/all

#tags
tag @s add barupdate
tag @s add attupdate
tag @s add statupdate
