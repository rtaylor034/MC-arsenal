#Calculates the strength to melee stats

#control get
execute store result score dmgnum var run data get storage cmd:controls/stats strengthToWeapon.dmg.numerator
execute store result score dmgdiv var run data get storage cmd:controls/stats strengthToWeapon.dmg.denominator
execute store result score aspeednum var run data get storage cmd:controls/stats strengthToWeapon.aspeed.numerator
execute store result score aspeeddiv var run data get storage cmd:controls/stats strengthToWeapon.aspeed.denominator

#dmg calc
scoreboard players operation temp var = @s stat_melee
scoreboard players operation temp var *= dmgnum var
scoreboard players operation temp var /= dmgdiv var
scoreboard players operation @s weap_dmg += temp var

#aspeed calc
scoreboard players operation temp var = @s stat_melee
scoreboard players operation temp var *= aspeednum var
scoreboard players operation temp var /= aspeeddiv var
scoreboard players operation @s weap_aspeed += temp var



#RESETS
scoreboard players reset temp var
scoreboard players reset dmgnum var
scoreboard players reset dmgdiv var
scoreboard players reset aspeednum var
scoreboard players reset aspeeddiv var
