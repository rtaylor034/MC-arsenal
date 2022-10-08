
#IN - (@s -> playerid) | playerid
#OUT - N/A
#USE - Removes "ownbar" from this players bars, should be called once in the same function after bars/find/run has been called

# # # # # NEVER EVER REMOVE "ownbar" TAG MANUALLY, PLEASE USE THIS FUNCTION # # # # #

#NOTE - Call this function instead of simply removing the "ownbar" tag at the end of a function. Using this prevents bars find stack complications.
#NOTE - IMPORTANT - This process **ABSOLUTELY MUST** be used EXACTLY ONCE every time bars/find/run has been called in the same function.
#NOTE - IMPORTANT - **DO NOT** remove the "track" tag manually or tamper with the (trackcount -> @s) score. This could lead to extreme issues.

#NOTE - works exactly like tracker find/unfind

scoreboard players operation barfind.id var = @s playerid
execute as @e[type=minecraft:armor_stand,tag=bar] if score @s playerid = barfind.id var run scoreboard players remove @s trackcount 1
tag @e[type=minecraft:armor_stand,tag=ownbar,scores={trackcount=..0}] remove ownbar

scoreboard players reset barfind.id var
