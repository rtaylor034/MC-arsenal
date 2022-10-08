
#IN - N/A
#OUT - N/A
#CONTEXT - Console
#DESC - destroys and unloads all playercells and kills all landmark entities relating to them.

execute as @e[type=marker,tag=playercell] at @s run fill ~5 ~-1 ~5 ~-5 ~4 ~-5 air
kill @e[type=marker,tag=playerbox]
kill @e[type=marker,tag=playercell]
