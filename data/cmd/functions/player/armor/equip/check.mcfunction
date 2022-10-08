#Called from player/main
#players should have armor on at all times unless they have the tag "noarmor"

execute unless entity @s[nbt={Inventory:[{Slot:100b,tag:{customtags:{armor:1}}}]}] run function cmd:player/armor/equip/boots
execute unless entity @s[nbt={Inventory:[{Slot:101b,tag:{customtags:{armor:1}}}]}] run function cmd:player/armor/equip/leggings
execute unless entity @s[nbt={Inventory:[{Slot:102b,tag:{customtags:{armor:1}}}]}] run function cmd:player/armor/equip/chestplate
execute unless entity @s[nbt={Inventory:[{Slot:103b,tag:{customtags:{armor:1}}}]}] run function cmd:player/armor/equip/helmet
execute unless entity @s[nbt={Inventory:[{Slot:103b,tag:{customtags:{armor:1}}}]}] run function cmd:player/armor/equip/helmet

execute unless entity @s[nbt={Inventory:[{Slot:0b,tag:{customtags:{weapon:1}}}]}] run function cmd:player/armor/equip/weapon
