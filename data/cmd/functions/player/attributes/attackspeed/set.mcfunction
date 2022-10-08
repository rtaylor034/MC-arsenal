
#USE - sets the "attack speed" attribute storage nbt to reflect this players weapon attack speed

scoreboard players set default var -40
scoreboard players operation a var = @s weap_aspeed
scoreboard players operation a var += default var

#add to attribute array
data modify storage cmd:var attributes prepend value {AttributeName:"generic.attack_speed",Name:"generic.movement_speed",Amount:0,Operation:0,UUID:[I;517999627,1764312796,-2006219554,-457951920]}

#modify value
execute store result storage cmd:var attributes[0].Amount float 0.1 run scoreboard players get a var

#RESETS
scoreboard players reset a var
scoreboard players reset default var
