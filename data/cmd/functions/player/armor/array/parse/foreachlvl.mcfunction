
#called from foreacharmor and weapon/parse

#DECRIMENT
scoreboard players remove parse.lvl var 1

#ADD TO TEXT ARRAY
data modify storage cmd:var lvltext append value "+"


#LOOP
execute if score parse.lvl var matches 1.. run function cmd:player/armor/array/parse/foreachlvl
