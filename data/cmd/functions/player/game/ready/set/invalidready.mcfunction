
#runs if [A] is 1 and this player is not valid (does not have all abilities equipped)

scoreboard players set @s prep_ready 0

#SFX
playsound minecraft:block.note_block.bass voice @p[tag=boxmenu-owner] ~ ~ ~ 1 0.63 1
