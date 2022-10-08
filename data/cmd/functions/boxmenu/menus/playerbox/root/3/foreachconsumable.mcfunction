
#gets each abilities item and adds it to (display.list.items -> var)



#get consumable item
execute store result score get.id var run data get storage cmd:var boxmenu.3.consumables[0].id
function cmd:consumable/item/get/run

#can buy?
execute if score @a[tag=boxmenu-owner,limit=1,sort=nearest] currency_c >= get.cost var run scoreboard players set boxmenu.3.canbuy var 1


#prepend to item array
data modify storage cmd:var display.list.items prepend from storage cmd:var get.item

#LORE
#cost
data merge block 0 0 0 {Text1:'[{"text":"Cost: ","color":"dark_aqua","bold":false,"italic":false},{"score":{"name":"get.cost","objective":"var"},"color":"gold","bold":false,"italic":true},{"text":"c","color":"gold","bold":false,"italic":true}]'}
data modify storage cmd:var display.list.items[0].tag.display.Lore prepend from block 0 0 0 Text1

#buy button
execute if score boxmenu.3.canbuy var matches 1 run data modify storage cmd:var display.list.items[0].tag.display.Lore prepend value '{"text":"[Buy]","bold":true,"italic":false,"color":"light_purple"}'
execute unless score boxmenu.3.canbuy var matches 1 run data modify storage cmd:var display.list.items[0].tag.display.Lore prepend value '{"text":"Cannot Buy","bold":true,"italic":false,"color":"dark_red"}'

#Menu tags
execute if score boxmenu.3.canbuy var matches 1 run data modify storage cmd:var display.list.items[0].tag.menu merge value {tags:{buy:1},playerbox:{}}
execute unless score boxmenu.3.canbuy var matches 1 run data modify storage cmd:var display.list.items[0].tag.menu merge value {tags:{invalid:1},playerbox:{s1:3}}

#buy tags
execute store result storage cmd:var display.list.items[0].tag.menu.tags.cost int 1 run scoreboard players get get.cost var
data modify storage cmd:var display.list.items[0].tag.menu.tags.id set from storage cmd:var boxmenu.3.consumables[0].id

#send item to back of array
#this is to keep items in correct order, instead of reverse, because items are prepended
data modify storage cmd:var display.list.items append from storage cmd:var display.list.items[0]
data remove storage cmd:var display.list.items[0]

#RESETS
scoreboard players reset boxmenu.3.canbuy var
#loop
data remove storage cmd:var boxmenu.3.consumables[0]
execute if data storage cmd:var boxmenu.3.consumables[] run function cmd:boxmenu/menus/playerbox/root/3/foreachconsumable
