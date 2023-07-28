
#Called when page is selected by item (from events/onselection/call)
#template - {Slot:0b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:1}}}}

#NOTE - This box must have a playerid score corresponding to which players box this is.

#Menu tags
execute store result storage cmd:var display.items[0].tag.menu.tags.cost int 1 run scoreboard players get get.cost var
data modify storage cmd:var display.items[0].tag.menu.tags.sell set value 1
data modify storage cmd:var display.items[0].tag.menu.playerbox set value {}


#sign parse cost
data modify block 0 0 0 front_text.messages[0] set value '[{"text":"Value: ","color":"dark_aqua","bold":false,"italic":false},{"score":{"name":"get.cost","objective":"var"},"color":"gold","bold":false,"italic":true},{"text":"c","color":"gold","bold":false,"italic":true}]'
data modify storage cmd:var display.items[0].tag.display.Lore prepend from block 0 0 0 front_text.messages[0]

#refund text
data modify storage cmd:var display.items[0].tag.display.Lore prepend value '{"text":"[Refund] ","color":"red","bold":true,"italic":false}'
