
#USE - sets the "maxhealth" attribute storage nbt to reflect this players health


#CONTROL GET
execute store result score div var run data get storage cmd:controls/display statPerIcon.health

#divide health by control
scoreboard players operation display var = @s health
scoreboard players operation display var /= div var

#subtract 20 (because players base health)
scoreboard players remove display var 20

#safety
execute if score display var matches ..-20 run scoreboard players set display var -19

#store
execute store result storage cmd:var amount int 1 run scoreboard players get display var

#add to attribute array
data modify storage cmd:var attributes prepend value {AttributeName:"generic.max_health",Name:"generic.max_health",Amount:0,Operation:0,UUID:[I;1022187111,1513180956,-1844394503,-1625906964]}

#modify value
data modify storage cmd:var attributes[0].Amount set from storage cmd:var amount

#RESETS
data remove storage cmd:var amount
scoreboard players reset display var
scoreboard players reset div var
