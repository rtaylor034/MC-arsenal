
#from foreachability

#store for comparison
execute store result score playerbox.2.equipped var run data get storage cmd:process/array/getmatching out[0].equipped

#does not match
execute unless score playerbox.2.equipped var = @s playerid run function cmd:boxmenu/menus/playerbox/root/2/equippedbyteam


#does match
execute if score playerbox.2.equipped var = @s playerid run data modify storage cmd:var display.list.items[0].tag.display.Lore prepend value '{"text":"[Equip]","bold":true,"italic":false,"color":"red"}'
execute if score playerbox.2.equipped var = @s playerid run data modify storage cmd:var display.list.items[0].tag.menu.tags.id set from storage cmd:process/array/getmatching out[0].id
