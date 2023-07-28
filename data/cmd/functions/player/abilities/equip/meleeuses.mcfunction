#CALL - genweapon

data modify storage cmd:var equip.a.uses append value {primary:1, cooldown:0, energyCost:0}
data modify storage cmd:var equip.a.uses[0].cooldown set from storage cmd:var equip.a.weapon.stats[{id:2}].value
