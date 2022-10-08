

#base item
execute if score get.success var matches 1 run item replace entity @s hotbar.4 with carrot_on_a_stick{customtags:{hotbar:4,consumableslot:4}}
execute unless score get.success var matches 1 run item replace entity @s hotbar.4 with black_dye{customtags:{hotbar:4,consumableslot:4}}

#nbt merge
item modify entity @s hotbar.4 cmd:mergenbt
