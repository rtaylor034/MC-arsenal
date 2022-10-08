
#IN - A @e[tag=boxmenu-refresh] | boxmenus to refresh
#OUT - N/A

#USE - call to refresh the displays of boxmenus specified in [A]. basically just re-selects the last item selected but without indication.

#NOTE - not meant to be called directly by a boxmenu, but to add targets to [A] and then call, like a message.

#store data from original context
data modify storage cmd:var refresh.temp set from storage cmd:var selection
tag @a[tag=boxmenu-owner] add boxmenu-refresh-og
tag @a[tag=boxmenu-owner] remove boxmenu-owner

#select as targets
execute unless data storage cmd:var selection.refresh as @e[type=marker,tag=boxmenu-refresh] at @s run function cmd:boxmenu/refresh/select

#set data back from original context
data modify storage cmd:var selection set from storage cmd:var refresh.temp
tag @a[tag=boxmenu-refresh-og] add boxmenu-owner

#RESETS
data remove storage cmd:var refresh
tag @a[tag=boxmenu-refresh-og] remove boxmenu-refresh-og
tag @e[type=marker,tag=boxmenu-refresh] remove boxmenu-refresh
