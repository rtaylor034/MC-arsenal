#CALL - genweapon

#for (ammo = ammo stat; ammo > 2)
execute store result score equip.sub.ammo var run data get storage cmd:var equip.a.weapon.stats[{id:4}].value
execute if score equip.sub.ammo var matches 2.. run function cmd:player/abilities/equip/sub/foreachammo

data modify storage cmd:var equip.a.uses[0].primary set value 1
data modify storage cmd:var equip.a.uses append value {cooldown:0, energyCost:0,waitCancel:1}
data modify storage cmd:var equip.a.uses[-1].cooldown set from storage cmd:var equip.a.weapon.stats[{id:3}].value


#RESETS
scoreboard players reset equip.sub.ammo var
