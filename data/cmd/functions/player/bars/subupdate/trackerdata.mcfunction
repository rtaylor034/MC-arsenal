
#CHILD FUNCTION OF player/bars/update

#reset
data modify entity @s data.bars set value []

#cycleto bar array
scoreboard players operation bars.cycleto.player var = @s playerid
function cmd:player/bars/array/cycleto/run


#add bars (use prepend)
data modify entity @s data.bars prepend from storage cmd:storage/bars array[0].health
data modify entity @s data.bars prepend from storage cmd:storage/bars array[0].playerName
#data modify entity @s data.bars prepend value '{"text":"ANOTHER BAR OR SOMETHING"}'

#count and store
data modify storage cmd:var barupdate.bars set from entity @s data.bars
execute store result score barupdate.barcount var if data storage cmd:var barupdate.bars[]
