#call - parse
#get.use is the current use, get.uses is how many uses this ability has in total (doesnt change)
#[cmd:var -> get.usedescs] is use description array

#increment
scoreboard players add get.use var 1

execute unless score get.uses var matches 2.. run function cmd:ability/item/get/singleuse
execute if score get.uses var matches 2.. run function cmd:ability/item/get/multiuse

#description
data modify storage cmd:var get.sub.descarr set from storage cmd:var get.usedescs
function cmd:ability/item/get/sub/descadd/run

#CYCLE
data modify storage cmd:var get.a.uses append from storage cmd:var get.a.uses[0]
data remove storage cmd:var get.a.uses[0]

#LOOP
execute if score get.use var < get.uses var run function cmd:ability/item/get/foreachuse
