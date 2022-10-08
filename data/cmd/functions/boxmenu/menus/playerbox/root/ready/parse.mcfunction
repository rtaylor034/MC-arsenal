

#Name should be set before this "[Ready]" or "[Unready]".


#MENU TAGS
execute if score isready var matches 1 run data modify storage cmd:var display.items[0].tag.menu.tags.unready set value 1
execute unless score isready var matches 1 run data modify storage cmd:var display.items[0].tag.menu.tags.ready set value 1


#store vars
execute store result storage cmd:var boxmenu.ready.ready int 1 if entity @a[tag=ingame,scores={prep_ready=1}]
execute store result storage cmd:var boxmenu.ready.total int 1 if entity @a[tag=ingame]


#NAME
execute if score isready var matches 1 run data modify storage cmd:var display.items[0].tag.display.Name set value '{"text":"[UNREADY]","italic":false,"bold":true,"color":"red"}'
execute unless score isready var matches 1 run data modify storage cmd:var display.items[0].tag.display.Name set value '{"text":"[READY]","italic":false,"bold":true,"color":"dark_green"}'


#LORE
execute if score isready var matches 1 run data modify block 0 0 0 Text1 set value '["",{"text":"(","bold":true,"color":"dark_green","italic":false},{"nbt":"boxmenu.ready.ready","storage":"cmd:var","bold":true,"color":"dark_green","italic":false},{"text":"/","bold":true,"color":"dark_green","italic":false},{"nbt":"boxmenu.ready.total","storage":"cmd:var","bold":true,"color":"dark_green","italic":false},{"text":")","bold":true,"color":"dark_green","italic":false},{"text":" Players Ready","color":"gray","italic":false}]'
execute unless score isready var matches 1 run data modify block 0 0 0 Text1 set value '["",{"text":"(","bold":true,"color":"gray","italic":false},{"nbt":"boxmenu.ready.ready","storage":"cmd:var","bold":true,"color":"gray","italic":false},{"text":"/","bold":true,"color":"gray","italic":false},{"nbt":"boxmenu.ready.total","storage":"cmd:var","bold":true,"color":"gray","italic":false},{"text":")","bold":true,"color":"gray","italic":false},{"text":" Players Ready","color":"gray","italic":false}]'
data modify storage cmd:var display.items[0].tag.display.Lore append from block 0 0 0 Text1


#SUBTEXT
data modify storage cmd:var display.items[0].tag.display.Lore append value '{"text":" The round will start when","color":"dark_gray","bold":false,"italic":false}'
data modify storage cmd:var display.items[0].tag.display.Lore append value '{"text":" all players are ready.","color":"dark_gray","bold":false,"italic":false}'


execute if score isready var matches 1 run data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.x
execute unless score isready var matches 1 run data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.confirm


#RESETS
data remove storage cmd:var boxmenu.ready
