
#Called from the thrown item
#DESC - Checks the thrown item, kills it unless it has the tag {customtags:{keepitem:1}}.
#NOTE - Most items should not have this tag, but some items like consumables or things that have no certain slot, this tag may be necassary so the player does not accidentally drop and delete the item.



#KEEP/KILL ITEM
data merge entity @s {PickupDelay:0s}
execute unless data storage cmd:var thrown.tag.customtags.keepitem run kill @s
