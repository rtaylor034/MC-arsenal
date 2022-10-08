

#base item
execute if score get.success var matches 1 run item replace entity @s hotbar.1 with carrot_on_a_stick{customtags:{hotbar:1,consumableslot:1}}
execute unless score get.success var matches 1 run item replace entity @s hotbar.1 with black_dye{customtags:{hotbar:1,consumableslot:1}}

#nbt merge
item modify entity @s hotbar.1 cmd:mergenbt
