
#from select

execute if data storage cmd:var selection.menu.tags.sell run function cmd:boxmenu/menus/playerbox/root/consumable/sell
execute if data storage cmd:var selection.menu.tags.buy run function cmd:boxmenu/menus/playerbox/root/consumable/buy
execute if data storage cmd:var selection.menu.tags.equip run function cmd:boxmenu/menus/playerbox/root/ability/equip
execute if data storage cmd:var selection.menu.tags.upgrade run function cmd:boxmenu/menus/playerbox/root/armor/upgrade
execute if data storage cmd:var selection.menu.tags.activate run function cmd:boxmenu/menus/playerbox/root/armor/activate
execute if data storage cmd:var selection.menu.tags.unready run function cmd:boxmenu/menus/playerbox/root/ready/unready
execute if data storage cmd:var selection.menu.tags.ready run function cmd:boxmenu/menus/playerbox/root/ready/ready
