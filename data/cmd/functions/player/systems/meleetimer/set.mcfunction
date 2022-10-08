
#CALL - events/deal/call, systems/meleetimer/base

#calculates and applies a meleetimer (melee cooldown) based on this players attack speed


scoreboard players set @s melee_timer 200
scoreboard players operation @s melee_timer /= @s weap_aspeed
