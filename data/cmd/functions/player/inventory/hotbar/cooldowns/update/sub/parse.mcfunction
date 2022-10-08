
#parses this item for mergenbt



#get item
scoreboard players operation get.playerid var = @s playerid
scoreboard players operation get.slot var = update.slot var
function cmd:ability/item/get/run
data modify storage cmd:var mergenbt set from storage cmd:var get.item.tag
