#called from @a
#CALL - playerstates/ingame/alive

#DECRIMENT
scoreboard players remove @s[scores={melee_timer=0..}] melee_timer 1

#WEAPON CHECK
#execute if score @s melee_timer matches ..20 as @s[predicate=!cmd:game/player/holding/weapon] run function cmd:player/systems/meleetimer/set
execute if score @s melee_timer matches ..20 as @s[nbt=!{SelectedItemSlot:0}] run function cmd:player/systems/meleetimer/set

#DURING
execute as @s[scores={melee_timer=1..}] run function cmd:player/systems/meleetimer/during



#CLEAR
execute as @s[scores={melee_timer=0}] run function cmd:player/systems/meleetimer/zero
