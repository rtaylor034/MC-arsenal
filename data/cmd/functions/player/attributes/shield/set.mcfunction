
#USE - sets the "armor" attribute storage nbt to reflect this players shield

#CONTROL GET
execute store result score div var run data get storage cmd:controls/display statPerIcon.health

#divide shield by control
scoreboard players operation display var = @s shield
scoreboard players operation display var /= div var

#store
execute store result storage cmd:var amount int 1 run scoreboard players get display var

#add to attribute array
data modify storage cmd:var attributes prepend value {AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUID:[I;-485368186,-1861596997,-1327990779,-205793382]}

#modify value
data modify storage cmd:var attributes[0].Amount set from storage cmd:var amount

#RESETS
data remove storage cmd:var amount
scoreboard players reset display var
scoreboard players reset div var
