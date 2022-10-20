#CALL - foreachpath, foreachaug

#GET BASE VAL -> equip.sub.pval
execute store result score equip.sub.pval var run data get storage cmd:var equip.slots[0].weapon.stats[0].value

#MULT
scoreboard players operation equip.sub.pval var *= equip.sub.pmult var
#rounding
scoreboard players add equip.sub.pval var 5

#STORE
execute store result storage cmd:var equip.slots[0].weapon.stats[0].value int 0.01 run scoreboard players get equip.sub.pval var
