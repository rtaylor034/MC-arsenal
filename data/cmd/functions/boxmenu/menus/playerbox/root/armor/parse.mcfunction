

#get item
scoreboard players operation armor.getitem.player var = @s playerid
execute store result score armor.getitem.type var run data get storage cmd:var display.items[0].tag.menu.tags.type
execute if data storage cmd:var display.items[0].tag.menu.tags.weapon run scoreboard players set armor.getitem.weapon var 1
function cmd:player/armor/getitem/run
data modify storage cmd:var display.items[0] merge from storage cmd:var armor.getitem.item

#LORE

#get stat info
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/armor statsPerUpgrade.armor
data modify storage cmd:process/array/cycleto tag.type set from storage cmd:var display.items[0].tag.menu.tags.type
function cmd:process/array/cycleto/run
data modify storage cmd:var boxmenu.root.armor.statinf set from storage cmd:process/array/cycleto out[0]

#get levels info
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/armor levels.armor
data modify storage cmd:process/array/cycleto tag.type set from storage cmd:var display.items[0].tag.menu.tags.type
function cmd:process/array/cycleto/run
execute unless data storage cmd:var display.items[0].tag.menu.tags.weapon run data modify storage cmd:var boxmenu.root.armor.levels set from storage cmd:process/array/cycleto out[0]
execute if data storage cmd:var display.items[0].tag.menu.tags.weapon run data modify storage cmd:var boxmenu.root.armor.levels set from storage cmd:controls/armor levels.weapon
execute store result score boxmenu.root.armor.max var run data get storage cmd:var boxmenu.root.armor.levels.max
execute store result score boxmenu.root.armor.passive var run data get storage cmd:var boxmenu.root.armor.levels.passive


#get this item level info
scoreboard players operation armor.cycleto.player var = @s playerid
execute store result score armor.cycleto.type var run data get storage cmd:var display.items[0].tag.menu.tags.type
function cmd:player/armor/array/cycleto/run

execute unless data storage cmd:var display.items[0].tag.menu.tags.weapon store result score boxmenu.root.armor.lvl var run data get storage cmd:storage/armor array[0].armor[0].level
execute if data storage cmd:var display.items[0].tag.menu.tags.weapon store result score boxmenu.root.armor.lvl var run data get storage cmd:storage/armor array[0].weapon.level


#cost
execute unless data storage cmd:var display.items[0].tag.menu.tags.weapon store result score format.number var run data get storage cmd:var boxmenu.root.armor.statinf.cost
execute if data storage cmd:var display.items[0].tag.menu.tags.weapon store result score format.number var run data get storage cmd:controls/armor statsPerUpgrade.weaponCost
scoreboard players operation boxmenu.root.armor.cost var = format.number var
scoreboard players set format.type var 2
function cmd:text/currency/format/run
#Menu tag
execute store result storage cmd:var display.items[0].tag.menu.tags.cost int 1 run scoreboard players get boxmenu.root.armor.cost var

#buystate
execute if score @p[tag=boxmenu-owner] currency_t >= boxmenu.root.armor.cost var run scoreboard players set boxmenu.root.armor.state var 1
execute if score boxmenu.root.armor.lvl var = boxmenu.root.armor.passive var run scoreboard players set boxmenu.root.armor.state var 3
execute if score @p[tag=boxmenu-owner] currency_t < boxmenu.root.armor.cost var run scoreboard players set boxmenu.root.armor.state var 2
execute if score boxmenu.root.armor.lvl var >= boxmenu.root.armor.max var run scoreboard players set boxmenu.root.armor.state var 4

#ready state (no lore)
execute if score isready var matches 1 run scoreboard players set boxmenu.root.armor.state var 5


#button
execute unless score boxmenu.root.armor.state var matches 4..5 run data modify block 0 0 0 front_text.messages[0] set value '[{"text":"Cost: ","color":"dark_aqua","bold":false,"italic":false},{"nbt":"format.text","storage":"cmd:var","interpret":true}]'
execute unless score boxmenu.root.armor.state var matches 4..5 run data modify storage cmd:var display.items[0].tag.display.Lore prepend from block 0 0 0 front_text.messages[0]

execute if score boxmenu.root.armor.state var matches 1 run data modify storage cmd:var display.items[0].tag.display.Lore prepend value '{"text":"[Upgrade]","color":"blue","italic":false,"bold":true}'
execute if score boxmenu.root.armor.state var matches 2 run data modify storage cmd:var display.items[0].tag.display.Lore prepend value '{"text":"Cannot Afford","color":"dark_red","italic":false,"bold":true}'
execute if score boxmenu.root.armor.state var matches 3 run data modify storage cmd:var display.items[0].tag.display.Lore prepend value '{"text":"[Activate]","color":"dark_purple","italic":false,"bold":true}'
execute if score boxmenu.root.armor.state var matches 4 run data modify storage cmd:var display.items[0].tag.display.Lore prepend value '{"text":"Max Level","color":"light_purple","italic":false,"bold":true}'

#Menu tags
execute unless score boxmenu.root.armor.state var matches 1 unless score boxmenu.root.armor.state var matches 3 run data modify storage cmd:var display.items[0].tag.menu.playerbox set value {}
execute if score boxmenu.root.armor.state var matches 3 run data modify storage cmd:var display.items[0].tag.menu.playerbox set value {s1:1,s2:1}

execute unless score boxmenu.root.armor.state var matches 1 unless score boxmenu.root.armor.state var matches 3 run data modify storage cmd:var display.items[0].tag.menu.tags.invalid set value 1

#RESETS
scoreboard players reset boxmenu.root.armor.lvl var
scoreboard players reset boxmenu.root.armor.passive var
scoreboard players reset boxmenu.root.armor.max var
scoreboard players reset boxmenu.root.armor.cost var
scoreboard players reset boxmenu.root.armor.state var

#COUNT LEVEL DISPLAY
#cycleto
#scoreboard players operation armor.cycleto.player var = @s playerid
#execute store result score armor.cycleto.type var run data get storage cmd:var display.items[0].tag.menu.tags.type
#function cmd:player/armor/array/cycleto/run

#execute unless data storage cmd:var display.items[0].tag.menu.tags.weapon store result score boxmenu.root.armor.lvl var run data get storage cmd:storage/armor array[0].armor[0].level
#execute if data storage cmd:var display.items[0].tag.menu.tags.weapon store result score boxmenu.root.armor.lvl var run data get storage cmd:storage/armor array[0].weapon.level
#scoreboard players add boxmenu.root.armor.lvl var 1

#execute store result storage cmd:var display.items[0].Count byte 1 run scoreboard players get boxmenu.root.armor.lvl var
