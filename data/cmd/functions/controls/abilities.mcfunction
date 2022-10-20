
#DESC - designated for all controls regarding abilities, notably the main ability array.
#IMPORTANT NOTE - make sure to not have any duplicate "id" keys in any array.

#TYPE KEY
#1 - Attack
#2 - Movement
#3 - Utility
#4 - Defense
#5 - Weapon

#SLOT KEY
#1 - Drop
#2 - Swap
#3 - Sneak
#4 - Weapon Click




#ABILITY TYPE IDENTITIES
#this controls how ability types are reffered too in parsing or text.
#NOTE - these should stay relatively consistent to their base names and only really use synonyms if needed
#base names: Attack - Movement - Utility - Defense - Weapon
#"name" is what the type is reffered too.
#"displayJson" is just the name in json format with its identity color. Mainly used for dynamically coloring text instead of having to use if statements.
#"color" is the color identity of the matching type. (used for border colors on ability icons)
data modify storage cmd:controls/abilities typeIdentities set value [{type:0,name:"All", displayJson:'{"text":"All","color":"white"}',color:{r:255,g:255,b:255}},{type:1,name:"Attack", displayJson:'{"text":"Attack","color":"red"}',color:{r:255,g:20,b:20}},{type:2,name:"Movement",displayJson:'{"text":"Movement","color":"yellow"}',color:{r:230,g:230,b:0}}, {type:3,name:"Utility",displayJson:'{"text":"Utility","color":"dark_green"}',color:{r:10,g:150,b:10}}, {type:4,name:"Defense",displayJson:'{"text":"Defense","color":"blue"}',color:{r:80,g:100,b:255}}, {type:5,name:"Weapon Enhance",displayJson:'{"text":"Weapon Enhance","color":"gold"}',color:{r:255,g:130,b:0}}]

#SLOT IDENTITIES
#this controls how slots are reffered too in parsing or text.
#NOTE - these should stay relatively consistent to their base names and only really use synonyms if needed
#base names: Drop - Swap - Sneak - Click
#"name" is what the type is reffered too.
#"keybind" is the json format for the keybind that this slot is bound to. (MUST BE SIGN PARSED IF USED)
data modify storage cmd:controls/abilities slotIdentities set value [{slot:1,name:"Drop",keybind:'{"keybind":"key.drop"}'},{slot:2,name:"Swap",keybind:'{"keybind":"key.swapOffhand"}'},{slot:3,name:"Sneak",keybind:'{"keybind":"key.sneak"}'},{slot:4,name:"Weapon Use",keybind:'{"keybind":"key.use"}'}]


#DEV NOTE - Ability descriptions are to be stored in a different array (will do later). I want everything to be finalized before i create descriptions.
#MAIN ABILITY ARRAY
#This controls what is stored in each players' tracker's ability array when an ability is equipped.
#"id" is the ability id, or the abilities unique identifier, this must be different for each ability
#"type" specifies the category the ability falls under (see type key).
#"uses" is an array that stores a information about each use of an ability. Most abilities will only have 1 use, but some may have multiple-cast effects, resulting in multiple cooldowns and energycosts etc. the first element in the uses array should have "primary:1" in it to mark the primary use.
#"uses[].cooldown" is the cooldown of the ability use. it is how long (in ticks) the player must wait before using the ability again.
#"uses[].energyCost" is how much energy is required to use the ability, and will be subtracted from the player when used.
#"uses[].primary" marks the primary use object for the ability (should pretty much always be in the first element)
#"uses[].maxWait" is how long the player has to use this ability once the Use Object preceeding it is used (in ticks). if it is not used in time, the ability will cancel and be put on cooldown. *only used if ability has multiple uses*
#"uses[].waitCancel" marks the Use Object that contains the cooldown the ability will be put on if cancelled by wait. (usually the last element) *only used if ability has multiple uses*

#DEACTIVATED FOR DEBUG PURPOSES, REACTIVATE WHEN NEEDED
data modify storage cmd:controls/abilities array set value []
data modify storage cmd:controls/abilities array append value {id:-1, type:1, devName:"test_ability1", name:"Test Ability 1", uses:[{primary:1,cooldown:100, energyCost:50}]}
data modify storage cmd:controls/abilities array append value {id:-2, type:2, devName:"test_ability2", name:"Test Ability 2", uses:[{primary:1,cooldown:10, energyCost:50},{cooldown:100, energyCost:0, maxWait:60, waitCancel:1}]}
data modify storage cmd:controls/abilities array append value {id:-3, type:3, devName:"test_ability3", name:"Test Ability 3", uses:[{primary:1,cooldown:3, energyCost:10},{cooldown:20, energyCost:20, maxWait:20},{cooldown:100, energyCost:30, maxWait:60, waitCancel:1}]}

#(FOR RANDOM TEST ABILITY GENERATION)
#scoreboard players set dev.generateabilities.id var -5
#function cmd:dev/placeholders/generateabilities
