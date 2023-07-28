
#called from run

#DECRIMENT
scoreboard players remove parse.desc var 1

#SIGN PARSE
data modify block 0 0 0 front_text.messages[0] set value '[{"text":"  "},{"nbt":"passive.desc[0]","storage":"cmd:var","color":"dark_aqua","bold":false,"italic":true,"underlined":false}]'
data modify storage cmd:var a.itemtag.display.Lore append from block 0 0 0 front_text.messages[0]



#CYCLE
data modify storage cmd:var passive.desc append from storage cmd:var passive.desc[0]
data remove storage cmd:var passive.desc[0]

#LOOP
execute if score parse.desc var matches 1.. run function cmd:player/armor/array/parse/foreachdesc
