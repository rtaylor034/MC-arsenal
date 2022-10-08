
#DESC - designated for all controls regarding displays that do not affect gameplay, whether it be HUD, textures, or attributes



#==== PLAYER ====
# - HEALTH/SHIELD PER ICON
#this controls how much health or shield is represented by each *half* heart/armor icon.
#(changes player/attributes)
data modify storage cmd:controls/display statPerIcon set value {health:10, shield:10}

#= BARS =
# - HEALTH BAR AUTO UPDATE DELAY [removed for now]
#this controls how many ticks can be elapsed before the players healthbar is automatically updated if it has not been updated recently. (basically how long the "damage taken" portion of the healthbar lasts)
#NOTE - this can be laggy if set too low.
#data modify storage cmd:controls/display bars.health.autoupdate set value 20


#==== ITEMS ====

# == ITEM ICONS "slime_ball" CustomModelData [1..500] ==
#this is basically a way to "name" common CustomModelData uses for universal icons.
#for example, if I wanted an "x" icon to show up in a menu, I would just set the CustomModelData of that item (a slimeball) to [itemIcon.x -> cmd:controls/display].
#this is to allow programming of menus without having to worry about textures, and just refer to the itemIcon.<name> in the function, and then set the CustomModelData here.
data modify storage cmd:controls/display itemIcon.x set value 1
data modify storage cmd:controls/display itemIcon.back set value 2
data modify storage cmd:controls/display itemIcon.ability.empty set value 3
data modify storage cmd:controls/display itemIcon.ability.attack set value 4
data modify storage cmd:controls/display itemIcon.ability.movement set value 5
data modify storage cmd:controls/display itemIcon.ability.utility set value 6
data modify storage cmd:controls/display itemIcon.ability.defense set value 7
data modify storage cmd:controls/display itemIcon.ability.weapon set value 8
data modify storage cmd:controls/display itemIcon.leftArrow set value 9
data modify storage cmd:controls/display itemIcon.rightArrow set value 10
data modify storage cmd:controls/display itemIcon.consumable.empty set value 11
#data modify storage cmd:controls/display itemIcon.sell set value 12
data modify storage cmd:controls/display itemIcon.bank set value 13
data modify storage cmd:controls/display itemIcon.confirm set value 14


# == COLORED ICONS "leather_helmet" ==
#STAT ICONS
#"offset" is the number that is added to a stat id to get its CustomModelData icon.
data modify storage cmd:controls/display statIcon.armor.offset set value 100
data modify storage cmd:controls/display statIcon.weapon.offset set value 150

#ABILITY ICONS
#"offset" is the number that is added to an ability id to get its CustomModelData icon.
#for example, if offset is 1000, and an ability has an id of 42, its CustomModelData icon should be located at {CustomModelData:1042} on "leather_helmet".
data modify storage cmd:controls/display abilityIcon.offset set value 1000

# == CONSUMABLE ICONS "carrot_on_a_stick" ==
#"offset" is the same as ability icon, but for carrot_on_a_stick.
data modify storage cmd:controls/display consumableIcon.offset set value 2000


# == DYNAMIC ICONS "purple_dye" ==
#PASSIVE ICONS
#refer to explanation above (for passive icons)
data modify storage cmd:controls/display passiveIcon.offset set value 4000
