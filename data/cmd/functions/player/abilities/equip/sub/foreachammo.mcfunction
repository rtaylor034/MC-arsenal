#CALL - rangeduses

#DECRIMENT
scoreboard players remove equip.sub.ammo var 1

data modify storage cmd:var equip.a.uses append value {cooldown:0, energyCost:0, maxWait:-1}
data modify storage cmd:var equip.a.uses[-1].cooldown set from storage cmd:var equip.a.weapon.stats[{id:2}].value


#LOOP
execute if score equip.sub.ammo var matches 2.. run function cmd:player/abilities/equip/sub/foreachammo
