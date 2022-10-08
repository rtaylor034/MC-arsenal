
#CALL - player/main
#DESC - Called by a player whenever they use a carrot_on_a_stick

#NOTE - this is mainly for control and efficiency, as many things are probably going to run off of a rodclick, depending on what item the player is holding

#HOLDING DATA
data modify storage cmd:var holding set from entity @s SelectedItem

#WEAPON CHECK / EVENT CALL: advancement/abilityslot/click
execute if data storage cmd:var holding.tag.customtags.weapon run function cmd:player/events/advancement/abilityslot/click/call

#CONSUMABLE CHECK / EVENT CALL: consumable/use
execute if data storage cmd:var holding.tag.customtags.consumable store result score consumable.id var run data get storage cmd:var holding.tag.customtags.consumable
execute if data storage cmd:var holding.tag.customtags.consumable run function cmd:player/events/consumable/use/call




#RESETS
scoreboard players reset @s rodclick
data remove storage cmd:var holding
