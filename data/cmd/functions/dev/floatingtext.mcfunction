
#creates a floating text (armor stand) with the name [floatingtext -> cmd:dev] with the tag "floatingtext"

execute align xz run summon minecraft:armor_stand ~.5 ~ ~.5  {Marker:1,Invisible:1,CustomName:'{"text":""}',CustomNameVisible:1,Tags:["floatingtext","init"]}

data merge block 0 0 0 {Text1:'{"nbt":"floatingtext","storage":"cmd:dev"}'}
data modify entity @e[tag=init,limit=1] CustomName set from block 0 0 0 Text1

tag @e remove init
