
#from equipped

#TAGS
data modify storage cmd:var display.list.items[0].tag.menu.playerbox set value {s1:2}
data modify storage cmd:var display.list.items[0].tag.menu.tags.invalid set value 1

#BUTTON
#find player
execute as @a if score @s playerid = playerbox.2.equipped var run tag @s add _equip-source

#sign parse
data modify block 0 0 0 front_text.messages[0] set value '[{"text":"Equipped by ","color":"dark_red","bold":true,"italic":false},{"selector":"@a[tag=_equip-source]","separator":" and ","color":"red","bold":true,"italic":false}]'

data modify storage cmd:var display.list.items[0].tag.display.Lore prepend from block 0 0 0 front_text.messages[0]

#remove tag
tag @a remove _equip-source
