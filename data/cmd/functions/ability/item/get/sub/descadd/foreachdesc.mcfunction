#CALL - run

data modify block 0 0 0 front_text.messages[0] set value '["",{"text":"   ","italic":false,"color":"#CCAACC"},{"nbt":"get.sub.descarr[0]","storage":"cmd:var","italic":false,"color":"#CCAACC"}]'
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 front_text.messages[0]


#LOOP
data remove storage cmd:var get.sub.descarr[0]
execute if data storage cmd:var get.sub.descarr[] run function cmd:ability/item/get/sub/descadd/foreachdesc
